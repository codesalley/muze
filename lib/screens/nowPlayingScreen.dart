import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:muze/constants.dart';
import 'package:muze/controllers/songPlayerController.dart';
import 'package:muze/models/song.dart';

import 'package:muze/widgets/customButton.dart';

enum Screen { songs, playlist, artist, album }

class NowPlaying extends StatefulWidget {
  static String nowPlaying = 'NowPLaying';
  Song song;
  int currentSongIndex;
  NowPlaying({this.song, this.currentSongIndex});

  @override
  _NowPlayingState createState() => _NowPlayingState();
}

class _NowPlayingState extends State<NowPlaying> {
  bool isPressed = false;
  dynamic nowPlaying;

  SongPlayerController player = Get.find();

  Future<void> startPlayer() async {
    if (player.currentSong?.path == null) {
      await player.musicStart(widget.song);
    } else if (player.currentSong.path != widget.song.path) {
      await player.disposePlayer();
      nowPlaying = widget.song;
      player.songPlayPauseRegulator(widget.song);
    }
  }

  @override
  void initState() {
    startPlayer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return GetBuilder<SongPlayerController>(
        init: SongPlayerController(),
        builder: (controller) {
          return Scaffold(
              body: SafeArea(
            child: Container(
              padding: EdgeInsets.only(left: 15, right: 15, top: height * 0.03),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Icon(
                          Icons.navigate_before_outlined,
                          color: Colors.white70,
                          size: 30,
                        ),
                      ),
                      Text(
                        'Now Playing',
                        style: KheaderTextstyle,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.playlist_play_outlined,
                            color: Colors.white70,
                            size: 30,
                          ),
                          Icon(
                            Icons.more_vert_outlined,
                            color: Colors.white70,
                            size: 30,
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 70,
                  ),
                  Container(
                    width: width / 1.5,
                    height: width / 1.5,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('res/album.jpg'),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(width / 0.75),
                      color: Colors.deepPurpleAccent,
                    ),
                  ),
                  SizedBox(
                    height: height / 15,
                  ),
                  Text(
                    '${widget.song.songTitle}',
                    style: kSongnameTextStyle.copyWith(
                      fontSize: 27,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    '${widget.song.artistName}',
                    style: kArtistnameTextStyle.copyWith(
                      fontSize: 20,
                      color: Colors.white60,
                    ),
                  ),
                  SizedBox(
                    height: height / 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.fast_rewind_rounded,
                        size: 35,
                      ),
                      CustomButton(
                        width: width,
                        size: 5,
                        iconData: controller.isPlaying
                            ? Icons.pause_outlined
                            : Icons.play_arrow_outlined,
                        isToggled: controller.isPlaying,
                        onpress: () {
                          setState(() {
                            controller.isPlaying = !controller.isPlaying;
                          });
                        },
                      ),
                      Icon(
                        Icons.fast_forward_rounded,
                        size: 35,
                      ),
                    ],
                  ),
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomButton(
                          width: width,
                          iconData: Icons.favorite,
                          size: 6,
                          isToggled: controller.isFavorite,
                          onpress: () {
                            setState(() {
                              controller.isFavorite = !controller.isFavorite;
                            });
                          },
                        ),
                        CustomButton(
                          width: width,
                          iconData: Icons.shuffle,
                          size: 6,
                          isToggled: controller.isShuffle,
                          onpress: () {
                            setState(() {
                              controller.isShuffle = !controller.isShuffle;
                            });
                          },
                        ),
                        CustomButton(
                          width: width,
                          iconData: Icons.repeat,
                          size: 6,
                          isToggled: controller.isRepeat,
                          onpress: () {
                            setState(() {
                              controller.isRepeat = !controller.isRepeat;
                            });
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ));
        });
  }
}
