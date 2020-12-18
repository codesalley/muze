import 'package:flutter/material.dart';
import 'package:muze/controllers/allSongs.dart';

import 'package:muze/testData/song.dart';
import 'package:muze/widgets/musicCard.dart';

import '../constants.dart';

class HomeScreen extends StatelessWidget {
  final controller = Songs.to;
  final allcontroller = AllSongs.to;

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
                    Container(
                      padding: EdgeInsets.only(
                        right: 70,
                        top: 10,
                        bottom: 10,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Songs', style: kCatergoryTextStyle),
                          Text(
                            'Playlists',
                            style: kCatergoryTextStyle.copyWith(
                              color: kInActiveColor,
                            ),
                          ),
                          Text(
                            'Artists',
                            style: kCatergoryTextStyle.copyWith(
                              color: kInActiveColor,
                            ),
                          ),
                          Text(
                            'Albums',
                            style: kCatergoryTextStyle.copyWith(
                              color: kInActiveColor,
                            ),
                          ),
                        ],
                      ),
                    ),
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
                    Flexible(
                      child: Container(
                        // height: kheight * 0.73,
                        alignment: Alignment.center,
                        child: ListView.builder(
                          itemCount: controller.songs.length,
                          itemBuilder: (context, int index) {
                            return MusicCard(
                              albumart: AssetImage('res/album.jpg'),
                              artistName:
                                  controller.songs.keys.elementAt(index),
                              songTitle:
                                  controller.songs.values.elementAt(index),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                print(allcontroller.allsongs);
              },
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    ),
                    color: KbackgroundColor,
                    border: Border.all(
                      color: Colors.black.withOpacity(0.6),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black54,
                        offset: Offset(
                          5,
                          -5,
                        ),
                        spreadRadius: 1,
                        blurRadius: 20,
                      ),
                    ],
                  ),
                  height: 70,
                  alignment: Alignment.center,
                  child: ListTile(
                    contentPadding: EdgeInsets.only(
                      left: 10,
                      top: 2,
                      right: 20,
                    ),
                    leading: Container(
                      width: 70,
                      child: Icon(
                        Icons.equalizer,
                        color: Colors.redAccent,
                      ),
                    ),
                    title: Text(
                      'Bana',
                      style: kSongnameTextStyle,
                    ),
                    subtitle: Text(
                      'Sapashini',
                      style: kArtistnameTextStyle,
                    ),
                    trailing: Container(
                      child: Icon(
                        Icons.pause,
                        color: Colors.redAccent,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
