import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class NoteInheritedWidgets extends InheritedWidget {


  final  notes = [
    {'titel': 'dddddddddddddddddddddd',
      'text': 'aaaaaaaaaaawwwwwww'
    },
    {'titel': 'sssssssssss',
      'text': 'saaaaaaaa'
    },
    {'titel': 'dddddddddddd',
      'text': 'ssssssssssssss'
    },
    {'titel': 'ffffffffff',
      'text': 'ccxbbbbbbbbbb'
    },
  ];

  NoteInheritedWidgets(Widget child) :super(child :child);

  static NoteInheritedWidgets of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(NoteInheritedWidgets)
        as NoteInheritedWidgets);
  }

  @override
  bool updateShouldNotify(NoteInheritedWidgets oldWidget) {
    return oldWidget.notes!=notes;
  }
}
