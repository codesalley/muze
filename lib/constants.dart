import 'package:flutter/material.dart';

const KbackgroundColor = Color(0xff0f0f0f);

const kiconColor = Color(0xFFD71D1D);

const kInActiveColor = Colors.white38;
const kActiveColor = Color(0xfffbf6f0);

const kCatergoryTextStyle = TextStyle(
  fontFamily: 'Roboto',
  fontSize: 18,
  fontWeight: FontWeight.w500,
  color: Colors.white70,
);

const KheaderTextstyle = TextStyle(
  fontSize: 22,
  fontFamily: 'Roboto',
  fontWeight: FontWeight.w700,
  color: kActiveColor,
);

const kArtistnameTextStyle = TextStyle(
  color: kActiveColor,
  fontFamily: 'Roboto',
  fontSize: 13,
  fontWeight: FontWeight.w500,
);
const kSongnameTextStyle = TextStyle(
  color: Color(0xfffbf6f0),
  fontFamily: 'Roboto',
  fontSize: 15,
  fontWeight: FontWeight.w600,
);

final kthemeData = ThemeData(
  brightness: Brightness.dark,
  backgroundColor: Color(0xFF31373D),
  splashColor: Color(0xFF1A1E21),
  scaffoldBackgroundColor: Color(0xFF282C31),
  primaryColor: Colors.pinkAccent,
  accentColor: Colors.pinkAccent,
  cursorColor: Colors.pinkAccent,
  dividerColor: Colors.white54,
  fontFamily: 'Acme',
  sliderTheme: SliderThemeData(
    trackHeight: 1.0,
    thumbColor: Colors.pinkAccent,
    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 6),
    overlayColor: Colors.pinkAccent.withOpacity(0.1),
    activeTrackColor: Colors.pinkAccent,
    inactiveTrackColor: Colors.white54,
  ),
);
