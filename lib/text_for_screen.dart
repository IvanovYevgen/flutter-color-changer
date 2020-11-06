import 'package:flutter/material.dart';

class TextForScreen extends StatelessWidget {
  const TextForScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        'Hey there!',
        style: TextStyle(fontSize: 30, color: Colors.black),
      ),
    );
  }
}
