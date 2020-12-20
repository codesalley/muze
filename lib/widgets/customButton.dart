import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton(
      {Key key,
      @required this.width,
      this.iconData,
      this.onpress,
      this.size,
      this.isToggled})
      : super(key: key);

  final double width;
  final int size;
  final IconData iconData;
  final Function onpress;
  final bool isToggled;

  //bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpress,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            width: 4,
            color: Theme.of(context).backgroundColor.withOpacity(0.5),
          ),
          color: Theme.of(context).scaffoldBackgroundColor,
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).backgroundColor,
              offset: Offset(-15, -15),
              blurRadius: 28,
              spreadRadius: 1,
            ),
            BoxShadow(
              color: Theme.of(context).splashColor,
              offset: Offset(15, 15),
              blurRadius: 28,
              spreadRadius: 1,
            ),
            BoxShadow(
              color: Theme.of(context).splashColor.withOpacity(0.6),
              offset: Offset(6, 6),
              blurRadius: 10,
              spreadRadius: 1,
            ),
            BoxShadow(
              color: Theme.of(context).backgroundColor.withOpacity(0.3),
              offset: Offset(-6, -6),
              blurRadius: 10,
              spreadRadius: 1,
            ),
          ],
          gradient: isToggled
              ? LinearGradient(
                  colors: [
                    Theme.of(context).splashColor,
                    Theme.of(context).backgroundColor,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0, 1],
                )
              : LinearGradient(
                  colors: [
                    Theme.of(context).backgroundColor,
                    Theme.of(context).splashColor,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0, 4],
                ),
        ),
        width: width / size,
        height: width / size,
        child: Icon(
          iconData,
          // Icons.pause_outlined,
          color: isToggled ? Color(0xFFD71D1D) : Colors.white.withOpacity(0.7),
        ),
      ),
    );
  }
}
