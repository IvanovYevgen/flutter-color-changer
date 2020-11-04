import 'package:flutter/material.dart';
import 'dart:math' as math;

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Color colorOfScreen;
  math.Random random = new math.Random();

  void randomGenerator() {
    setState(() {
      colorOfScreen = Color.fromARGB(
          255, random.nextInt(255), random.nextInt(255), random.nextInt(255));
      print('color has changed!');
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: randomGenerator,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: colorOfScreen,
          body: Center(
            child: Container(
              child: Text(
                'Hey there!',
                style: TextStyle(fontSize: 30, color: Colors.black),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
