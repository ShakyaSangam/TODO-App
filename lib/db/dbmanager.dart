import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbManager {
  Database _database;

  // database, table, field names
  final String dbname = "todo.db";
  final String tablename = "list";
  final String idfield = "id";
  final String titlefield = "title";

  Future createdb() async {
    if (_database == null) {
      //get location of file system (database file system)
      var databasepath = await getDatabasesPath();
      var path = join(databasepath, "todo.db"); // document/todo.db

      _database = await openDatabase(path, version: 1,
          onCreate: (Database db, int version) async {
        await db.execute(
            "CREATE TABLE list (id INTEGER PRIMARY KEY autoincrement, title TEXT)");
      });
    }
  }

  Future<int> insertRecord(ToDo todo) async {
    await createdb();
    return await _database.insert("list", todo.toMap());
  }

  Future<List<ToDo>> display() async{
    await createdb();
    List<Map<String, dynamic>> map = await _database.query("list");
    return List.generate(map.length, (int i){
      return ToDo(
        id: map[i]['id'],
        title: map[i][titlefield]
      );
    });
  }

  Future<void> deleterecord(int id) async {
    await createdb();
    return await _database.delete("list", where: "id = ?", whereArgs: [id]);
  }

  Future<int> updaterecord(ToDo todo) async {
    await createdb();
    return await _database.update("list", todo.toMap(), where: "id = ?",  whereArgs: [todo.id]);
  }

/// returns null ERROR result ???
  Future<int> countRecord() async{
    // return Sqflite.firstIntValue(await _database.rawQuery("SELECT COUNT(id) FROM list"));
    int count = Sqflite.firstIntValue(await _database.rawQuery("SELECT COUNT(id) FROM list"));
    return count;
  }
}

class ToDo {
  int id;
  String title;

  ToDo({this.id, @required this.title});

  Map<String, dynamic> toMap() {
    return {'title': this.title};
  }

}
