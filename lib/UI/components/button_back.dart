import 'package:flutter/material.dart';

class ButtonBack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      child: Text('Back'),
    );
  }
}