import 'package:flutter/material.dart';
import 'package:change_color_app/text_for_screen.dart';
import 'dart:math' as math;
import 'animated_figures.dart';

enum _generationMode { random, manual }

class ColorChanger extends StatefulWidget {
  @override
  _ColorChangerState createState() => _ColorChangerState();
}

class _ColorChangerState extends State<ColorChanger> {
  List<Widget> scoreKeeper = [];

  Color randomColorOfScreen;
  math.Random random = new math.Random();

  _generationMode _mode = _generationMode.random;

  List<bool> _selections = List.generate(2, (_) => false);

  @override
  void initState() {
    _selections = [true, false];
    super.initState();
  }

  void randomColorGenerator() {
    if (_mode == _generationMode.random) {
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
                    borderColor: Colors.orange,
                    selectedColor: Colors.white,
                    disabledColor: Colors.grey,
                    fillColor: Colors.orange,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Random Color'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Animated Figures'),
                      ),
                    ],
                    onPressed: (int index) {
                      setState(() {
                        for (int buttonIndex = 0;
                            buttonIndex < _selections.length;
                            buttonIndex++) {
                          if (buttonIndex == index) {
                            _selections[buttonIndex] =
                                !_selections[buttonIndex];
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
    return Center(
      child: AnimatedFigures(),
    );
  }
}
