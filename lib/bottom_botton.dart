import 'package:flutter/material.dart';
import 'contants.dart';

class BottomButton extends StatelessWidget {

  final Function onPress;
  final String title;

  BottomButton({this.title, this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        padding: EdgeInsets.only(bottom: 8),
        child: Center(
            child: Text(
              title,
              //style: kBigNumberStyle.copyWith(fontSize: 24),
              style: kBottomContainerTextStyle,
            )),
        color: kBottomContainerColor,
        width: double.infinity,
        height: kBottomContainerHeight,
      ),
    );
  }
}

