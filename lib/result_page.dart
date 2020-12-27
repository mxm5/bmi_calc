import 'package:bmi_calculator/input_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'bottom_botton.dart';
import 'reusablle_card.dart';
import 'contants.dart';

class ResultPage extends StatelessWidget {
  final String bmi;
  final String resultText;
  final String resultInterpretation;

  ResultPage(
      {this.bmi = '18.2',
      this.resultInterpretation = 'normal',
      this.resultText = 'ff normal'});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Bmi calculater'.toUpperCase(),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: ReusableCard(
              color: kInActiveCardColor,
              child: Center(
                child: Text(
                  'Yor Result',
                  style: kResultTitleStyle,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              color: kActiveCardColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(resultText,style: kResultNameStyle,textAlign: TextAlign.center,),
                  Text(
                    bmi,
                    style: kResultBMIStyle
                    ,textAlign: TextAlign.center,
                  ),
                  Text(
                    resultInterpretation,
                    style: kResultDescribeStyle,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
            title: 'RE-CALCULATE',
            onPress: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
