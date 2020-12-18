import 'package:flutter/material.dart';

import '../constants.dart';

class MusicCard extends StatelessWidget {
  MusicCard({this.albumart, this.artistName, this.songTitle});
  final AssetImage albumart;
  final String artistName;
  final String songTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.yellow,
      height: 70,
      margin: EdgeInsets.only(top: 5),
      child: ListTile(
        contentPadding: EdgeInsets.only(
          left: 0,
        ),
        leading: Image(
          image: albumart,
        ),
        title: Text('$songTitle', style: kSongnameTextStyle),
        subtitle: Text(
          '$artistName',
          style: kArtistnameTextStyle,
        ),
        trailing: Icon(
          Icons.more_vert_outlined,
          color: kActiveColor,
        ),
      ),
    );
  }
}
