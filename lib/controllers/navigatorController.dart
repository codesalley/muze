import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:muze/screens/album.dart';
import 'package:muze/screens/artist.dart';
import 'package:muze/screens/playlist.dart';
import 'package:muze/screens/songs.dart';

class NavigationController extends GetxController {
  List<Widget> screens = [
    SongsWidget(),
    PlayliistWidget(),
    ArtistWidget(),
    AlbumWidget(),
  ].obs();

  int currentSreen = 0.obs();
  Widget currentS = SongsWidget().obs();

  static NavigationController get to => Get.find<NavigationController>();
}
