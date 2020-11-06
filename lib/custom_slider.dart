import 'package:flutter/material.dart';

class CustomSlider extends StatefulWidget {
  final Function onChanged;
  final double currentSliderValue;
  final String titleOfSlider;
  

  CustomSlider({
    this.onChanged,
    this.currentSliderValue,
    this.titleOfSlider,
  });

  @override
  _CustomSliderState createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
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
                  widget.currentSliderValue.toString(),
                  style: TextStyle(fontSize: 22),
                ),
              ),
              Text(
                'Value of ${widget.titleOfSlider}',
                style: TextStyle(fontSize: 23),
              ),
            ],
          ),
        ),
        Slider(
          value: widget.currentSliderValue,
          min: 0,
          max: 255,
          divisions: 25,
          onChanged: widget.onChanged,
        ),
      ],
    );
  }
}
