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
                MaterialButton(
                  onPressed: () {},
                  child: Text(
                    "Save",
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.blue,
                ),
                MaterialButton(
                  onPressed: () {},
                  child: Text(
                    "Discard",
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.grey,
                ),
                MaterialButton(
                  onPressed: () {},
                  child: Text(
                    "Delete",
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.red,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
