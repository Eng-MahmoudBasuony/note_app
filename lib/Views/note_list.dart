import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note_app/Views/note.dart';
import 'package:note_app/inherited_widgets/note_inherited_widgets.dart';

class NoteList extends StatefulWidget {
  @override
  NoteListState createState() {
    return NoteListState();
  }
}

class NoteListState extends State<NoteList> {

  List<Map<String, String>> get _notes {
    return NoteInheritedWidgets.of(context).notes;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Note(NoteMode.Editing,index)));
            },
            child: Card(
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 30.0, bottom: 30.0, left: 13.0, right: 22.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _NoteTitle(_notes[index]['titel']),
                    Container(
                      height: 4,
                    ),
                    _NoteText(_notes[index]['text']),
                  ],
                ),
              ),
            ),
          );
        }, //item Builder
        itemCount: _notes.length, //item Count
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {

          Navigator.push(context,
              MaterialPageRoute(builder: (context) => Note(NoteMode.Adding,0)));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class _NoteTitle extends StatelessWidget {
  final String _titel;

  _NoteTitle(this._titel);

  @override
  Widget build(BuildContext context) {
    return Text(
      _titel,
      style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
    );
  }
}

class _NoteText extends StatelessWidget {

  final String _text;
  _NoteText(this._text);

  @override
  Widget build(BuildContext context) {
    return Text(
      _text,
      style: TextStyle(color: Colors.grey.shade600),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }
}
