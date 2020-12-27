import 'package:flutter/material.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: InputPage(),
      theme: ThemeData.dark().copyWith(
          accentColor: Colors.red,
          primaryColor: Color(0xFF0A0E21),
          backgroundColor: Colors.red,
          cardColor: Colors.red,
          buttonColor: Colors.red,
          bottomAppBarColor: Colors.red,
          primaryIconTheme: IconThemeData(color: Colors.red),
          floatingActionButtonTheme:
          FloatingActionButtonThemeData(backgroundColor: Colors.red),
          scaffoldBackgroundColor: Color(0xFF0A0E21),
          textTheme: TextTheme(
              body1: TextStyle(
                  color: Colors.pink[200]
              )
          )
      ),

    );
  }
}

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
      body: Center(
        child: Text('Body Text'),
      ),
      floatingActionButton: Theme(
        data: ThemeData(
            floatingActionButtonTheme:
            FloatingActionButtonThemeData(backgroundColor: Colors.green
              //............................................
              // the place that a change occur in the course
              // is that the FAB is not changing via accent color
              // but with its own theme data argument
              // ...............................................
            )),
        child: FloatingActionButton(
//        backgroundColor: Colors.red,
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
