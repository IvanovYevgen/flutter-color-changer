import 'package:flutter/material.dart';
import 'package:flutter_hsvcolor_picker/flutter_hsvcolor_picker.dart';
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

  List<bool> _selections = List.generate(2, (_) => false);

  void colorGenerator() {
    if (_selections[0] == true) {
      setState(() {
        colorOfScreen = Color.fromARGB(
            255, random.nextInt(255), random.nextInt(255), random.nextInt(255));
        print('color has changed!');
      });
    } else {
      // setState(() => currentColor = pickerColor);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: colorGenerator,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SafeArea(
          child: Scaffold(
            backgroundColor: colorOfScreen,
            body: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 30),
                    child: ToggleButtons(
                      color: Colors.black,
                      selectedColor: Colors.amberAccent,
                      disabledColor: Colors.green[100],
                      fillColor: Colors.deepPurple,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Random Color'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('ColorPicker'),
                        ),
                      ],
                      onPressed: (int index) {
                        setState(() {
                          for (int buttonIndex = 0;
                              buttonIndex < _selections.length;
                              buttonIndex++) {
                            if (buttonIndex == index) {
                              _selections[buttonIndex] = true;
                            } else {
                              _selections[buttonIndex] = false;
                            }
                          }
                        });
                      },
                      isSelected: _selections,
                    ),
                  ),
                  Container(
                    child: Text(
                      'Hey there!',
                      style: TextStyle(fontSize: 30, color: Colors.black),
                    ),
                  ),
                  Container(
                    child:
                        ColorPicker(color: Colors.blue, onChanged: (value) {}),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
