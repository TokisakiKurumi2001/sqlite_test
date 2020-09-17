import '../db/database_creator.dart';

class Vocab {
  int id;
  String word;

  Vocab(this.id, this.word);

  Vocab.fromJson(Map<String, dynamic> json) {
    this.id = json[DatabaseCreator.id];
    this.word = json[DatabaseCreator.word];
  }
}
