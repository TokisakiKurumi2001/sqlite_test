import 'package:flutter/material.dart';
import 'TodoCard.dart';

class TodoList extends StatefulWidget {
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  final List<String> listOfTodos = [
    "Coconut",
    "Juice",
    "Watermelon",
    "LOL",
    "LOL",
    "LOL",
    "LOL"
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return TodoCard(
          word: listOfTodos[index],
        );
      },
      itemCount: listOfTodos.length,
    );
  }
}
