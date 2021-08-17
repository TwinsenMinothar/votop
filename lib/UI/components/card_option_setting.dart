import 'package:flutter/material.dart';

import '../../models/models.dart';

class CardOption extends StatefulWidget {
  final OptionSetting optionSetting;

  CardOption(this.optionSetting);

  @override
  _CardOptionState createState() => _CardOptionState();
}

class _CardOptionState extends State<CardOption> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: CheckboxListTile(
        value: widget.optionSetting.selected != false,
        onChanged: (bool? value) {
          changeState();
        },
        title: Text(widget.optionSetting.title),
        subtitle: Text(widget.optionSetting.description),
        secondary: Icon(widget.optionSetting.iconData),
      ),
    );
  }

  void changeState() {
    return setState(() {
      if (widget.optionSetting.selected == false) {
        widget.optionSetting.selected = true;
      } else {
        widget.optionSetting.selected = false;
      }
    });
  }
}
