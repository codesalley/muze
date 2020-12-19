import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:muze/screens/homeScreen.dart';

import 'controllers/allSongs.dart';
import 'controllers/songPlayerController.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(AllSongs());
  Get.put(SongPlayerController());
  // AllSongs.to;
  // SongPlayerController.to;

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    VisualDensity.adaptivePlatformDensity;
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
