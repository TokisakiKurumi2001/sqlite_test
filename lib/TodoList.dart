import 'package:flutter/material.dart';
import 'TodoCard.dart';
import 'models/Vocab.dart';

class TodoList extends StatefulWidget {
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  final List<Vocab> listOfTodos = [];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return TodoCard(
          vocab: listOfTodos[index],
        );
      },
      itemCount: listOfTodos.length,
    );
  }
}
