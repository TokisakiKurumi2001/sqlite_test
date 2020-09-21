import 'package:flutter/material.dart';
import 'db/database_creator.dart';
import 'db/interact_with_db.dart';
import 'models/Vocab.dart';
import 'Vocabs.dart' as vs;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseCreator().initDB();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SqfLiteCrud(title: 'Flutter Demo Home Page'),
    );
  }
}

class SqfLiteCrud extends StatefulWidget {
  SqfLiteCrud({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SqfLiteCrudState createState() => _SqfLiteCrudState();
}

class _SqfLiteCrudState extends State<SqfLiteCrud> {
  @override
  initState() {
    super.initState();
    vs.future = DBInteract.getAllVocabs();
  }

  Card buildItem(Vocab vocab) {
    TextEditingController _editWord = TextEditingController();
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
                onPressed: () async {
                  await showDialog<void>(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Edit word'),
                          content: TextField(
                            controller: _editWord,
                          ),
                          actions: <Widget>[
                            FlatButton(
                                onPressed: () {
                                  vs.updateTodo(vocab, _editWord.text);
                                  setState(() {
                                    vs.future = DBInteract.getAllVocabs();
                                  });
                                  Navigator.pop(context);
                                },
                                child: Text('OK'))
                          ],
                        );
                      });
                },
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
                onPressed: () {
                  vs.deleteTodo(vocab);
                  setState(() {
                    vs.future = DBInteract.getAllVocabs();
                  });
                },
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

  Container inputText() {
    TextEditingController _controller = TextEditingController();
    return Container(
      child: Column(
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
                onPressed: () async {
                  String word = _controller.text;
                  await vs.createTodo(word);
                  setState(() {
                    vs.future = DBInteract.getAllVocabs();
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('sqfLite CRUD'),
      ),
      body: ListView(
        padding: EdgeInsets.all(8),
        children: <Widget>[
          inputText(),
          FutureBuilder<List<Vocab>>(
            future: vs.future,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                    children:
                        snapshot.data.map((todo) => buildItem(todo)).toList());
              } else {
                return SizedBox();
              }
            },
          )
        ],
      ),
    );
  }
}
