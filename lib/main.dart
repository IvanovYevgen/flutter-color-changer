import 'dart:math';

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
  @override
  Widget build(BuildContext context) {
    Color colorOfScreen;

    void randomGenerator() {
      Random random = new math.Random();
      setState(() {
        colorOfScreen = Color.fromARGB(
            255, random.nextInt(255), random.nextInt(255), random.nextInt(255));
      });
      print('color has changed!');
    }

    return GestureDetector(
      onTap: randomGenerator,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: colorOfScreen,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  child: Text(
                    'Hey there!',
                    style: TextStyle(fontSize: 30, color: Colors.black),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
