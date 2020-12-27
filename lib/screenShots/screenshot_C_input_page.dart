import 'package:flutter/material.dart';
import 'package:bmi_calculator/Icon_text.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../reusablle_card.dart';

const Color activeCardColor = Color(0xFF1D1E33);
const Color inActiveCardColor = Color(0xFF111328);
const Color bottomContainerColor = Color(0xFFEB1555);
const double bottomContainerHeight = 67.0;
enum Genders { male , female}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = inActiveCardColor;

  Color femaleCardColor = inActiveCardColor;

//  ....................................................................
//  void updateColor({int gender}) {
//    if (gender == 1 ) {
//      maleCardColor = activeCardColor;
//      femaleCardColor = inActiveCardColor;
//    } else if (gender == 1 ) {
//      maleCardColor = inActiveCardColor;
//    }
//    if (gender == 2 ) {
//      femaleCardColor = activeCardColor;
//      maleCardColor = inActiveCardColor;
//    } else if (gender == 2 ) {
//      femaleCardColor = inActiveCardColor;
//    }
//  }
//  ....................................................................

  // 1 = male 2 = female
  void updateColor({Genders selectedGender}) {
    if (selectedGender == Genders.male) {
      if (maleCardColor == inActiveCardColor) {
        maleCardColor = activeCardColor;
        femaleCardColor = inActiveCardColor;
      } else {
        maleCardColor = inActiveCardColor;
      }
    }
    if (selectedGender == Genders.female) {
      if (femaleCardColor == inActiveCardColor) {
        femaleCardColor = activeCardColor;
        maleCardColor = inActiveCardColor;
      } else {
        femaleCardColor = inActiveCardColor;
      }
    }
  }

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
                  Expanded(
                      child: GestureDetector(
                        onTap: () {
                          // famous void callback
                          //print('male was pressed');
                          setState(() {
                            updateColor(selectedGender: Genders.male);
                          });
                        },
                        child: ReusableCard(
                          color: maleCardColor,
                          child: IconText(
                            icon: FontAwesomeIcons.mars,
                            title: 'MALE',
                          ),
                        ),
                      )),
                  Expanded(
                      child: GestureDetector(
                        onTap: () {
                          //print('fem was pressed');
                          setState(() {
                            updateColor(selectedGender: Genders.female);
                          });
                        },
                        child: ReusableCard(
                          color: femaleCardColor,
                          child: IconText(
                            icon: FontAwesomeIcons.venus,
                            title: 'FEMALE',
                          ),
                        ),
                      )),
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(
                color: activeCardColor,
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: ReusableCard(
                        color: activeCardColor,
                      )),
                  Expanded(
                      child: ReusableCard(
                        color: activeCardColor,
                      )),
                ],
              ),
            ),
            Container(
              color: bottomContainerColor,
              width: double.infinity,
              height: bottomContainerHeight,
            )
          ],
        ));
  }
}
