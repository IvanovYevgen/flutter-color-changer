import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'custom_slider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

// enum _mode{random, manual}

class _MyAppState extends State<MyApp> {
  Color randomColorOfScreen;
  math.Random random = new math.Random();

  double _currentSliderValueA = 10;
  double _currentSliderValueB = 10;
  double _currentSliderValueC = 10;
  double _currentSliderValueD = 10;

  List<bool> _selections = List.generate(2, (_) => false);

  void colorGenerator() {
    if (_selections[0] == true) {
      setState(() {
        randomColorOfScreen = Color.fromARGB(
            255, random.nextInt(255), random.nextInt(255), random.nextInt(255));
        print('color has changed!');
      });
    } else {
      setState(() {
        randomColorOfScreen = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: colorGenerator,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: randomColorOfScreen,
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
//  switch(_mode) {
//     case _mode.random: print("This is not the correct case.");
//     break;
//     case _mode.manual: print("This is not the correct case.");
//     break;
//   }
// }

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
                Column(
                  children: [
                    CustomSlider(
                      currentSliderValue: _currentSliderValueA,
                      titleOfSlider: 'Alfa',
                      onChanged: (_range) {
                        setState(() {
                          _currentSliderValueA = _range;
                        });
                        print({_currentSliderValueA});
                      },
                    ),
                    CustomSlider(
                      currentSliderValue: _currentSliderValueB,
                      titleOfSlider: 'Red',
                      onChanged: (_range) {
                        setState(() {
                          _currentSliderValueB = _range;
                        });
                        print({_currentSliderValueB});
                      },
                    ),
                    CustomSlider(
                      currentSliderValue: _currentSliderValueC,
                      titleOfSlider: 'Green',
                      onChanged: (_range) {
                        setState(() {
                          _currentSliderValueC = _range;
                        });
                        print({_currentSliderValueC});
                      },
                    ),
                    CustomSlider(
                      currentSliderValue: _currentSliderValueD,
                      titleOfSlider: 'Blue',
                      onChanged: (_range) {
                        setState(() {
                          _currentSliderValueD = _range;
                        });
                        print({_currentSliderValueD});
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
