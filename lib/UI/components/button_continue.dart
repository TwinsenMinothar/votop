import 'package:flutter/material.dart';

class ButtonContinue extends StatelessWidget {
  final Function nextPage;
  final Function? save;

 const ButtonContinue({
    required this.nextPage,
    this.save
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed:  () {
        if(save != null)
          save!();
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => nextPage() ),
        );
      },
      child: Text('Continue'),
    );
  }
}
