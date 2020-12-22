import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
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

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onpress,
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
          gradient: widget.isToggled
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
        width: widget.width / widget.size,
        height: widget.width / widget.size,
        child: Icon(
          widget.iconData,
          // Icons.pause_outlined,
          color: widget.isToggled
              ? Color(0xFFD71D1D)
              : Colors.white.withOpacity(0.7),
        ),
      ),
    );
  }
}
