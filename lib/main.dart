import 'package:change_color_app/text_for_screen.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'custom_slider.dart';

void main() {
  runApp(MyApp());
}

double _currentSliderValue = 10;
enum _generationMode { random, manual }

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Widget> scoreKeeper = [];

  Color randomColorOfScreen;
  math.Random random = new math.Random();

  _generationMode _mode = _generationMode.random;

  double _currentSliderValue = 10;

  List<bool> _selections = List.generate(2, (_) => false);

  void randomColorGenerator() {
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
      onTap: randomColorGenerator,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: randomColorOfScreen,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Center(
                  child: _display(_mode),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 15, 15),
                child: Stack(alignment: Alignment.bottomRight, children: [
                  ToggleButtons(
                    color: Colors.black,
                    borderColor: Colors.red[700],
                    selectedColor: Colors.amberAccent,
                    disabledColor: Colors.grey,
                    fillColor: Colors.orange,
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
                            _mode = _generationMode.manual;
                          } else {
                            _selections[buttonIndex] = false;
                            _mode = _generationMode.random;
                          }
                        }
                        print('$_mode');
                      });
                    },
                    isSelected: _selections,
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _display(modeOfState) {
  if (modeOfState == _generationMode.random) {
    return TextForScreen();
  } else {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomSlider(
            currentSliderValue: _currentSliderValue,
            titleOfSlider: 'Alfa',
            onChanged: (_range) {
              setState(() {
                _currentSliderValue = _range;
              });
              print({_currentSliderValue});
            },
          ),
          // CustomSlider(
          //   currentSliderValue: 10,
          //   onChanged: changeOfSliderValue(_currentSliderValue),
          //   titleOfSlider: 'Alfa',
          // ),
          // CustomSlider(
          //   currentSliderValue: 10,
          //   onChanged: null,
          //   titleOfSlider: 'Red',
          // ),
          // CustomSlider(
          //   currentSliderValue: 10,
          //   onChanged: null,
          //   titleOfSlider: 'Green',
          // ),
          // CustomSlider(
          //   currentSliderValue: 10,
          //   onChanged: null,
          //   titleOfSlider: 'Blue',
          // ),
          //       Slider(
          //   min: 0,
          //   max: 100,
          //   value: _value,
          //   onChanged: (value) {
          //     setState(() {
          //       _value = value;
          //     });
          //   },
          // ),
        ],
      ),
    );
  }
}
