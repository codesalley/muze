import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:muze/controllers/allSongs.dart';
import 'package:muze/controllers/songPlayerController.dart';
import 'package:muze/modules/song.dart';
import 'package:muze/widgets/categoryBar.dart';

import 'package:muze/widgets/musicCard.dart';
import 'package:muze/widgets/nowPlayingCard.dart';

import '../constants.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final allcontroller = AllSongs.to;
  final musciController = SongPlayerController.to;
  @override
  void initState() {
    super.initState();
  }

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
                    Flexible(
                      child: Container(
                        height:
                            musciController.isPlaying ? kheight * 0.72 : null,
                        alignment: Alignment.center,
                        child: FlatButton(
                          onPressed: () {},
                          child: Text('Press'),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Visibility(
              visible: musciController.isPlaying,
              child: GestureDetector(
                onTap: () async {
                  await allcontroller.getAllSongs();
                  // print(allcontroller.allsongs[1].path);
                  print('pressed');
                },
                child: NowPlayingCard(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
