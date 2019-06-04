import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note_app/inherited_widgets/note_inherited_widgets.dart';

enum NoteMode { Editing, Adding }

class Note extends StatefulWidget {
  final NoteMode noteMode;
  final int index;

  Note(this.noteMode, this.index);


  @override
  NoteState createState() => NoteState();
}

class NoteState extends State<Note> {
  final TextEditingController _titelController = TextEditingController();
  final TextEditingController _textController = TextEditingController();

  List<Map<String, String>> get _noteList =>
      NoteInheritedWidgets.of(context).notes;


@override
  void didChangeDependencies() {


    if(widget?.noteMode==NoteMode.Editing)
    {
      //SET Text TO TextField
      _titelController.text=_noteList[widget.index]['titel'];
      _textController.text=_noteList[widget.index]['text'];
    }

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
/*
      if(_noteMode==NoteMode.Adding)
      {
        return "Add Note";
      }else
        {
          return "Edit Note"
        }             equivalent Short Statement => _noteMode==NoteMode.Adding?"Add Note":"Edit Note"
      */
      appBar: AppBar(
        title:
            Text(widget.noteMode == NoteMode.Adding ? "Add Note" : "Edit Note"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _titelController,
              decoration: InputDecoration(hintText: 'Note Title'),
            ),
            Container(
              height: 8.0,
            ),
            TextField(
              controller: _textController,
              decoration: InputDecoration(hintText: "Note Text"),
            ),
            Container(
              height: 18.0,
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _NoteButton("Save", Colors.blue, () {
                    if (widget?.noteMode == NoteMode.Adding) {

                      final titel = _titelController.text;
                      final text = _textController.text;
                       // Add Data to List
                      _noteList.add({'titel': titel, 'text': text});
                    } else if (widget?.noteMode == NoteMode.Editing)
                    {
                      final titel = _titelController.text;
                      final text = _textController.text;
                      //Update index for Note
                      _noteList[widget.index] = {'titel': titel, 'text': text};
                    }
                    Navigator.pop(context);
                  }),
                  Container(
                    height: 16.0,
                  ),
                  _NoteButton("Discard", Colors.grey, () {
                    Navigator.pop(context);
                  }),
                  Container(
                    height: 16.0,
                  ),
                  widget.noteMode == NoteMode.Editing //Check Editing Or Not
                      ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: _NoteButton("Delete", Colors.red, ()
                          {
                            _noteList.removeAt(widget.index);
                            Navigator.pop(context);
                          }))
                      : Container(),
                ])
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

  _NoteButton(this._text, this._color, this._onPressed);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: _onPressed,
      child: Text(
        _text,
        style: TextStyle(color: Colors.white),
      ),
      color: _color,
      minWidth: 100,
      height: 45,
    );
  }
}
