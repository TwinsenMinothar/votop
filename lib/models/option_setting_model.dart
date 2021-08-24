import 'package:flutter/material.dart';

class OptionSetting {
  final IconData iconData;
  final String title;
  final String description;

  OptionSetting({
    required this.iconData,
    required this.title,
    required this.description,
  });

  bool selected = false;
}