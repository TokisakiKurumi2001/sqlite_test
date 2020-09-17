import 'package:flutter/material.dart';
import 'Input.dart';
import 'TodoList.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('SQLite'),
        ),
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Input(),
              Expanded(
                child: TodoList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
