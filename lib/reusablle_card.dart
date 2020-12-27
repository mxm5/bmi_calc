import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Color color;
  final Widget child;
  final Function onPress;

  ReusableCard({@required this.color, this.child,this.onPress});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: onPress ,
        child: Container(
          margin: EdgeInsets.all(11),
          child: child,
          decoration:
              BoxDecoration(color: color, borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }
}
