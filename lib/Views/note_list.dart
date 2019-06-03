import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note_app/Views/note.dart';

class NoteList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes'),
      ),
      body: ListView.builder(itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Note()));
          },
          child: Padding(
            padding: const EdgeInsets.only(
                top: 30.0, bottom: 30.0, left: 13.0, right: 22.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _NoteTitle(),
                Container(
                  height: 4,
                ),
                _NoteText(),
              ],
            ),
          ),
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Note()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class _NoteTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      "some Titel",
      style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
    );
  }
}

class _NoteText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      "AutomaticKeepAlives can be disabled by setting the "
      "addAutomaticKeepAlives field to false."
      " This is useful in cases where the elements don’t"
      " need to be kept alive or for a custom implementation of KeepAlive "
      "AutomaticKeepAlives can be disabled by setting the "
      "addAutomaticKeepAlives field to false."
      " This is useful in cases where the elements don’t"
      " need to be kept alive or for a custom implementation of KeepAlive",
      style: TextStyle(color: Colors.grey.shade600),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }
}
