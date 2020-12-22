import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:muze/controllers/allSongsController.dart';
import 'package:muze/controllers/songPlayerController.dart';
import 'package:muze/screens/homeScreen.dart';

class SplashScreen extends StatefulWidget {
  static String splashScreen = 'splash';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  AnimationController animationcontroller;
  CurvedAnimation curvedAnimation;
  Animation animation;
  final controller = Get.find<AllSongs>();
  final musicController = Get.find<SongPlayerController>();

  @override
  void initState() {
    animationcontroller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
      upperBound: 1.0,
    )..addListener(() async {
        if (animationcontroller.isCompleted) {
          musicController.allSongs = await controller.allsongs;
          Get.to(HomeScreen());
        }
      });

    animation = ColorTween(begin: Colors.blueAccent, end: Colors.tealAccent)
        .animate(animationcontroller);

    curvedAnimation = CurvedAnimation(
      parent: animationcontroller,
      curve: Curves.easeIn,
    );
    animationcontroller.forward();
    super.initState();
  }

  @override
  void deactivate() {
    animationcontroller.dispose();
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return AnimatedBuilder(
        animation: animationcontroller,
        builder: (context, child) {
          return Scaffold(
            backgroundColor: animation.value,
            body: Center(
              child: Container(
                width: 200,
                height: 200,
                color: animation.value,
                //margin: EdgeInsets.only(top: curvedAnimation.value * 100),
                child: Center(
                  child: Text(
                    'Welcome to Muze',
                    style: TextStyle(fontSize: curvedAnimation.value * 40),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
