import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/Icon_text.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../reusablle_card.dart';
import '../contants.dart';

enum Genders { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Genders selectedGender;
  int height = 180;

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
                        Text('heigt'.toUpperCase(),style: kSmallTextStyle,),
                        Row(

                          textBaseline: TextBaseline.alphabetic,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          children: <Widget>[
                            Text('$height',style: kBigNumberStyle,),
                            Text('cm',style: kSmallTextStyle,)
                          ],
                        ),
                        SliderTheme(
                        data: SliderTheme.of(context).copyWith(
//                          ////////////////////////////////////////////////////////////
//                          ///..........................................................
//                          ///we override here man so then
//                          ///so the bot theme can be bothering so we delete them
//                          ///..........................................................
//                          ////////////////////////////////////////////////////////////
                        ),
                          child: Slider(
//                          ////////////////////////////////////////////////////////////
//                          ///..........................................................
//                          ///the current slider we cant change the color of the
//                          /// shape of slider or shadow of it but we need to create
//                          /// a heme widget withe slider theme or rather a slider theme widget
//                          /// with data of that
//                          ///..........................................................
//                          /// and we also want to make the theme a little adjusted not fully
//                          /// adjusted so we copy the current them and override it
//                          ///..........................................................
//                          ////////////////////////////////////////////////////////////
                            value: height.toDouble(),
                            activeColor: kThePinkColor,
                            inactiveColor: kTheWhiteColor,
                            max: 230.0,
                            min: 140.0,
                            onChanged: (double newValue){
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
                        color: kActiveCardColor,
                      )),
                  Expanded(
                      child: ReusableCard(
                        color: kActiveCardColor,
                      )),
                ],
              ),
            ),
            Container(
              color: kBottomContainerColor,
              width: double.infinity,
              height: kBottomContainerHeight,
            )
          ],
        ));
  }
}
