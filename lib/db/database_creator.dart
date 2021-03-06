/*
 *  This file create a database called `lingo`
 *  In this db, there is a table called `words`
 *  Having the following schema:
 *  id             | word
 *  INTEGER        | TEXT
 *  PRIMARY KEY    | NOT NULL
 */

import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

Database db;

class DatabaseCreator {
  static const tableName = 'words';
  static const id = 'id';
  static const word = 'word';

  static void databaseLog(String functionName, String sql,
      [List<Map<String, dynamic>> selectQueryResult,
      int insertAndUpdateResult,
      List<dynamic> params]) {
    print(functionName);
    print(sql);
    if (params != null) {
      print(params);
    }

    if (selectQueryResult != null) {
      print(selectQueryResult);
    } else if (insertAndUpdateResult != null) {
      print(insertAndUpdateResult);
    }
  }

  Future<void> createWordTable(Database db) async {
    final sql = '''
    CREATE TABLE IF NOT EXISTS $tableName (
      $id INTEGER PRIMARY KEY,
      $word TEXT NOT NULL
    )
    ''';
    await db.execute(sql);
  }

  Future<String> getDBPath(String dbName) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, dbName);

    if (await Directory(dirname(path)).exists()) {
      //await deleteDatabase(path);
    } else {
      await Directory(dirname(path)).create(recursive: true);
    }

    return path;
  }

  Future<void> initDB() async {
    final path = await getDBPath('lingo');
    db = await openDatabase(path, version: 1, onCreate: onCreate);
    print(db);
  }

  Future<void> onCreate(Database db, int version) async {
    await createWordTable(db);
  }
}
