import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/Icon_text.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusablle_card.dart';
import 'contants.dart';
import 'result_page.dart';
import 'bottom_botton.dart';
import 'rounded_icon_button.dart';
import 'calculator_brain.dart';

enum Genders { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Genders selectedGender;
  int height = 180;
  int weight = 60;
  int age = 20;

  bool validLowerVal() {
    if (weight > 0 && age > 0) {
      return true;
    } else {
      return false;
    }
  }

//  bool validLowerWeight = weight.isNegative ? true : false ;
  //..................................................
  // when we don't initiate a variable it's always Null
  //..................................................

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Genders.male;
                      });
                    },
                    color: selectedGender == Genders.male
                        ? kActiveCardColor
                        : kInActiveCardColor,
                    child: IconText(
                      iconColor: selectedGender == Genders.male
                          ? Colors.white
                          : kTheWhiteColor,
                      icon: FontAwesomeIcons.mars,
                      title: 'MALE',
                    ),
                  )),
                  Expanded(
                      child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Genders.female;
                      });
                    },
                    color: selectedGender == Genders.female
                        ? kActiveCardColor
                        : kInActiveCardColor,
                    child: IconText(
                      iconColor: selectedGender == Genders.female
                          ? Colors.white
                          : kTheWhiteColor,
                      icon: FontAwesomeIcons.venus,
                      title: 'FEMALE',
                    ),
                  )),
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text(
                          'heigt'.toUpperCase(),
                          style: kSmallTextStyle,
                        ),
                        Row(
                          textBaseline: TextBaseline.alphabetic,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          children: <Widget>[
                            Text(
                              '$height',
                              style: kBigNumberStyle,
                            ),
                            Text(
                              'cm',
                              style: kSmallTextStyle,
                            )
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            thumbColor: kThePinkColor,
                            overlayColor: kTheOverlyPinkColor,
                            thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 16),
                            overlayShape:
                                RoundSliderOverlayShape(overlayRadius: 32),
//                            activeTrackColor: Colors.white,
                            activeTrackColor: Colors.pink[200],
                            inactiveTrackColor: kTheWhiteColor,
                          ),
                          child: Slider(
                            value: height.toDouble(),
                            //activeColor: kThePinkColor,
                            //inactiveColor: kTheWhiteColor,
                            max: 230.0,
                            min: 120.0,
                            onChanged: (double newValue) {
                              //print(newValue);//the value printed successfully
                              setState(() {
                                height = newValue.round();
                              });
                            },
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                color: kActiveCardColor,
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: ReusableCard(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'weight'.toUpperCase(),
                          style: kSmallTextStyle,
                        ),
                        Text(
                          '$weight',
                          style: kBigNumberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundedIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPress: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                            SizedBox(
                              width: 6.0,
                            ),
                            RoundedIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPress: () {
                                setState(() {
                                  if (validLowerVal()) {
                                    weight--;
                                  }
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                    color: kActiveCardColor,
                  )),
                  Expanded(
                      child: ReusableCard(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'age'.toUpperCase(),
                          style: kSmallTextStyle,
                        ),
                        Text(
                          '$age',
                          style: kBigNumberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundedIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPress: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                            SizedBox(
                              width: 6.0,
                            ),
                            RoundedIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPress: () {
                                setState(() {
                                  if (validLowerVal()) {
                                    age--;
                                  }
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                    color: kActiveCardColor,
                  )),
                ],
              ),
            ),
            BottomButton(
              title: 'calculate'.toUpperCase(),
              onPress: () {
                CalculatorBrain cal =
                    CalculatorBrain(height: height, weight: weight);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultPage(
                      resultText: cal.result(),
                      //||//........................................................//
                      //TODO: THIS BUG WAS FIXED BUT IT WAS VERY IMPORTANT
                      //||// when we call this function result
                      //||// because it needs -bmi variable it cant be called first
                      //||// cuz no bmi is said but if we want to call this
                      //||// we must first call the getBMI to create a bmi
                      //||// so i initialized it manually with zero that caused
                      //||// miscalculation with zero and the correction after
                      //||// calling the get bmi to make real bmi.
                      //||// for result to work so if the sequence order was
                      //||// violated we need to start it in constructor using
                      //||// sugar syntax of : in constructor ok ?? .
                      //||//........................................................//
                      bmi: cal.getBMI(),
                      resultInterpretation: cal.xResult(),
                    ),
                  ),
                );
              },
            )
          ],
        ));
  }
}
