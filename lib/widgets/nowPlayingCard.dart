import 'package:flutter/material.dart';

import '../constants.dart';

class NowPlayingCard extends StatelessWidget {
  const NowPlayingCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(45),
            topRight: Radius.circular(45),
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
        height: 75,
        alignment: Alignment.center,
        child: ListTile(
          contentPadding: EdgeInsets.only(
            left: 10,
            top: 2,
            right: 30,
          ),
          leading: Container(
            padding: EdgeInsets.only(top: 10),
            decoration: BoxDecoration(),
            width: 70,
            child: Icon(
              Icons.equalizer,
              color: kiconColor,
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
              color: kiconColor,
            ),
          ),
        ),
      ),
    );
  }
}
