import 'package:flutter/material.dart';

List<Option> options = [
  Option(),
  Option(),
];

class Option extends StatelessWidget {
  late IconData? trashOption;

  Option({this.trashOption});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Option',
        icon: Icon(Icons.add),
        hintText: 'Add option',
        suffixIcon: trashOption != null
            ? IconButton(
          icon: Icon(trashOption),
          onPressed: options.length > 2
              ? () {
            options.removeLast();
          }
              : null,
        )
            : null,
      ),
    );
  }
}