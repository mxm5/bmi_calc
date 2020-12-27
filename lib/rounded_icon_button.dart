import 'package:flutter/material.dart';

//TODO: remember to check flutter range slider on the flutter packages

class RoundedIconButton extends StatelessWidget {
  RoundedIconButton({@required this.icon, @required this.onPress});

  final IconData icon;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPress,
      child: Icon(icon),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
//        FOR MINI SIZE
//        height: 40.0,
//        width: 40.0,
      ),
    );
  }
}
