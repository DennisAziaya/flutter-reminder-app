import 'dart:collection';

import 'package:flutter/material.dart';

import 'custom_colors.dart';

class CustomColorCollection {
  final List<CustomColors> _colors = [
    CustomColors(id: 'blue_accent', color: Colors.blueAccent),
    CustomColors(id: 'orange', color: Colors.orange),
    CustomColors(id: 'red_accent', color: Colors.redAccent),
    CustomColors(id: 'light_green', color: Colors.lightGreen),
    CustomColors(id: 'deep_orange', color: Colors.deepOrange),
    CustomColors(id: 'yellow_accent', color: Colors.yellowAccent),
  ];

  UnmodifiableListView<CustomColors> get colors =>
      UnmodifiableListView(_colors);
  CustomColors findColorById(id) {
    return _colors.firstWhere((customColor) => customColor.id == id);
  }
}
