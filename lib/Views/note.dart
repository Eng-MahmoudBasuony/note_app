import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Note extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Note'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(hintText: 'Note Title'),
            ),
            Container(
              height: 8.0,
            ),
            TextField(
              decoration: InputDecoration(hintText: "Note Text"),
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly
                ,
                children: <Widget>[
                  _NoteButton("Save", Colors.blue, () {}),
                  _NoteButton("Discard", Colors.grey, () {}),
                  _NoteButton("Delete", Colors.red, () {})
                ]
            )
          ],
        ),
      ),
    );
  }
}


class _NoteButton extends StatelessWidget {
  final String _text;
  final Color _color;
  final Function _onPressed;

  _NoteButton(this._text, this._color, this._onPressed)


  @override
  Widget build(BuildContext context) {
    return MaterialButton(onPressed: _onPressed,
      child: Text(_text, style: TextStyle(color: Colors.white),),
      color: _color,);
  }
}

