import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:muze/constants.dart';

import 'package:muze/screens/homeScreen.dart';
import 'package:muze/screens/spalshScreen.dart';

import 'controllers/allSongs.dart';
import 'controllers/songPlayerController.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(AllSongs());
  Get.put(SongPlayerController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    VisualDensity.adaptivePlatformDensity;
    return GetMaterialApp(
      theme: kthemeData,
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
