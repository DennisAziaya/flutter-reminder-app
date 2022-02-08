import 'dart:collection';

import 'package:dev_todo/common/custom_icon.dart';
import 'package:flutter/cupertino.dart';

class CustomIconCollection {
  final List<CustomIcon> _icons = [
    CustomIcon(id: 'bars', icon: CupertinoIcons.bars),
    CustomIcon(id: 'alarm', icon: CupertinoIcons.alarm),
    CustomIcon(id: 'airplane', icon: CupertinoIcons.airplane),
    CustomIcon(id: 'person', icon: CupertinoIcons.person),
    CustomIcon(id: 'calendar_today', icon: CupertinoIcons.calendar_today),
    CustomIcon(id: 'waveform_path', icon: CupertinoIcons.waveform_path),
  ];

  UnmodifiableListView<CustomIcon> get icons => UnmodifiableListView(_icons);

  CustomIcon findIconById(id) {
    return _icons.firstWhere((customIcon) => customIcon.id == id);
  }
}
