import 'package:flutter/material.dart';
import 'models/Vocab.dart';

class TodoCard extends StatelessWidget {
  final Vocab vocab;
  TodoCard({this.vocab});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Text(
            '${vocab.word}',
            style: TextStyle(fontSize: 40),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              FlatButton(
                color: Colors.purple.shade700,
                onPressed: () {},
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.edit,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      'Edit',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
              FlatButton(
                color: Colors.red.shade700,
                onPressed: () {},
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      'Delete',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
