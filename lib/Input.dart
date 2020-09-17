import 'package:flutter/material.dart';

class Input extends StatefulWidget {
  @override
  _InputState createState() => _InputState();
}

class _InputState extends State<Input> {
  TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 20.0, left: 25.0),
          child: Text(
            'Enter new word',
            style: TextStyle(fontSize: 25),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Container(
            child: TextField(
              controller: _controller,
              onSubmitted: (String value) {
                _controller.clear();
                print('You typed $value');
              },
            ),
          ),
        ),
        Center(
          child: Container(
            margin: EdgeInsets.only(top: 20.0),
            child: MaterialButton(
              color: Colors.blue[400],
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: Text(
                  'Add',
                  style: TextStyle(fontSize: 30, color: Colors.grey[100]),
                ),
              ),
              onPressed: () {},
            ),
          ),
        ),
      ],
    );
  }
}
