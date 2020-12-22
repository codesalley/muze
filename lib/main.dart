import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:muze/constants.dart';
import 'package:muze/controllers/binding.dart';
import 'package:path_provider/path_provider.dart' as path;
import 'package:muze/screens/homeScreen.dart';
import 'package:muze/screens/spalshScreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var initPath = await path.getApplicationDocumentsDirectory();
  await Hive.init(initPath.path);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    VisualDensity.adaptivePlatformDensity;
    return GetMaterialApp(
      theme: kthemeData,
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.splashScreen,
      initialBinding: HomeBinding(),
      getPages: [
        GetPage(
          name: SplashScreen.splashScreen,
          page: () => SplashScreen(),
          transition: Transition.downToUp,
        ),
        GetPage(
          name: HomeScreen.homeScreen,
          page: () => HomeScreen(),
          transition: Transition.downToUp,
        ),
      ],
    );
  }
}
