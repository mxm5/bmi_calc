import 'package:flutter/material.dart';

const Color activeCardColor = Color(0xFF1D1E33);
const Color bottomContainerColor = Color(0xFFEB1555);
const double bottomContainerHeight = 67.0;

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(child: ReusableCard(color:activeCardColor ,)),
                  Expanded(child: ReusableCard(color:activeCardColor ,)),
                ],
              ),
            ),
            Expanded(child: ReusableCard(color:activeCardColor ,),),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(child: ReusableCard(color:activeCardColor ,)),
                  Expanded(child: ReusableCard(color:activeCardColor ,)),
                ],
              ),
            ),
            Container(
              color: bottomContainerColor,
              width: double.infinity,
              height: bottomContainerHeight,
            )
          ],
        )
    );
  }
}

class ReusableCard extends StatelessWidget {
//  const ReusableCard({
//    Key key,            //............................
//  }) : super(key: key); // the default constructor
////////////////////////..................................
//////////////////////////////////////////////////....................
//  ReusableCard({@required this.color = Colors.purple }) // with starting vale
/////////////////////// final keyword used o make whole props immutable
  final Color color;
  ReusableCard({@required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(11),
      decoration: BoxDecoration(
          color: color, //Color(0xFF1D1E33),//..................................
          borderRadius: BorderRadius.circular(10)
      ) ,
    );
  }
}

//TODO: go to youtube and watch emily on flutter team channel the video name is " when to use widgets Flutter widgets 101 ep.4 " .class
//.........................
// Hint
// how to give a constructor default value
//.........................
//class human {
//  int height;
//  human({this.height = 10});
//}
//
//void main(){
//  human x = human();
//  print(x.height); // STEP 1
//  human y = human( height: 20);
//  print(y.height);
//}
////.........................
////console
////
////    10
////    20
////.........................
