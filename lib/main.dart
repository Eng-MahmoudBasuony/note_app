import 'package:flutter/material.dart';
import 'package:note_app/Views/note_list.dart';
import 'package:note_app/inherited_widgets/note_inherited_widgets.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return NoteInheritedWidget(
      MaterialApp(
        title: 'Notes',
        home: NoteList(),
      ),
    );
  }
}
