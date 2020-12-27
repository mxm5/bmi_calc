import 'dart:ui';

import 'package:flutter/material.dart';
import 'contants.dart';

class IconText extends StatelessWidget {

  final IconData icon;
  final Color iconColor;
  final String title;

  IconText({this.icon, this.title,this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Column(
      textBaseline: TextBaseline.ideographic,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,

      children: <Widget>[
        Icon(
          icon,
          size: kIconSize,
          color: iconColor,

        ),
        SizedBox(
          width: double.infinity,
          height: 8.0,
        ),
        Text(
          title,
          style: TextStyle(color: kTextColor, fontSize: 14.8),
        ),
      ],
    );
  }
}
