import 'package:flutter/material.dart';

List<Option> options = [];

class Option extends StatelessWidget {
  String title;
  Option(this.title);
  TextEditingController titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: titleController,
      decoration: InputDecoration(
        labelText: this.title,
        icon: Icon(Icons.add),
        hintText: 'Add option',
      ),
    );
  }
}
