import 'package:flutter/material.dart';

class ButtonContinue extends StatelessWidget {
  final Function nextPage;

  const ButtonContinue({
    required this.nextPage,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed:  () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => nextPage() ),
        );
      },
      child: Text('Continue'),
    );
  }
}
