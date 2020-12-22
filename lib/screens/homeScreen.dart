import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:muze/controllers/allSongsController.dart';
import 'package:muze/controllers/songPlayerController.dart';

import 'package:muze/screens/nowPlayingScreen.dart';

import 'package:muze/widgets/categoryBar.dart';
import 'package:muze/widgets/musicCard.dart';

import '../constants.dart';

class HomeScreen extends StatelessWidget {
  static String homeScreen = 'homescreen';
  SongPlayerController musicPlayer = Get.find();
  @override
  Widget build(BuildContext context) {
    final kheight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: KbackgroundColor,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              child: Container(
                decoration: BoxDecoration(color: KbackgroundColor),
                margin: EdgeInsets.only(
                  top: 10,
                  left: 20,
                  right: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text(
                              'My Music',
                              style: KheaderTextstyle,
                            ),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.search,
                                color: kActiveColor,
                                size: 30,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Icon(
                                Icons.settings_backup_restore_outlined,
                                color: kActiveColor,
                                size: 30,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    CategoryBar(),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Row(
                        children: [
                          Icon(
                            Icons.shuffle_outlined,
                            color: kActiveColor,
                          ),
                          Text(
                            'Shuffle',
                            style: kCatergoryTextStyle,
                          ),
                        ],
                      ),
                    ),
                    GetBuilder<AllSongs>(
                        init: AllSongs(),
                        builder: (controller) {
                          return Expanded(
                            child: ListView.builder(
                                itemCount: controller.allsongs.length,
                                itemBuilder: (context, int index) {
                                  return MusicCard(
                                    albumart: AssetImage('res/album.jpg'),
                                    artistName:
                                        controller.allsongs[index].artistName,
                                    songTitle:
                                        controller.allsongs[index].songTitle,
                                    onpress: () async {
                                      musicPlayer.currentSongIndex = index;

                                      Get.to(NowPlaying(
                                        song: await controller.allsongs[index],
                                        currentSongIndex: index,
                                      ));
                                    },
                                  );
                                }),
                          );
                        }),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
