import 'package:flutter/material.dart';

import '../constants.dart';

class CategoryBar extends StatelessWidget {
  const CategoryBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        right: 70,
        top: 10,
        bottom: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Songs', style: kCatergoryTextStyle),
          Text(
            'Playlists',
            style: kCatergoryTextStyle.copyWith(
              color: kInActiveColor,
            ),
          ),
          Text(
            'Artists',
            style: kCatergoryTextStyle.copyWith(
              color: kInActiveColor,
            ),
          ),
          Text(
            'Albums',
            style: kCatergoryTextStyle.copyWith(
              color: kInActiveColor,
            ),
          ),
        ],
      ),
    );
  }
}
