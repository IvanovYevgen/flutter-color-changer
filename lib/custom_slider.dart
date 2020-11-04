import 'package:flutter/material.dart';

class CustomSlider extends StatelessWidget {
  final Function onChanged;
  final double currentSliderValue;
  final String titleOfSlider;

  CustomSlider({
    Key key,
    this.onChanged,
    this.currentSliderValue,
    this.titleOfSlider,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  currentSliderValue.toString(),
                  style: TextStyle(fontSize: 22),
                ),
              ),
              Text(
                'Value of $titleOfSlider',
                style: TextStyle(fontSize: 23),
              ),
            ],
          ),
        ),
        Slider(
          value: currentSliderValue,
          min: 0,
          max: 255,
          divisions: 25,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
