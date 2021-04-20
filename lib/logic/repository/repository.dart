import 'package:todo/logic/models/todo_model.dart';
import 'package:todo/logic/providers/dbmanager.dart';

class Repository {
  DbManager _dbManager = DbManager();

  Future createdb() async => _dbManager.createdb();

  Future<int> insertRecord(ToDo todo) async => _dbManager.insertRecord(todo);

  Future<List<ToDo>> display() async => _dbManager.display();

  Future<void> deleterecord(int id) async => _dbManager.deleterecord(id);

  Future<int> updaterecord(ToDo todo) async => _dbManager.updaterecord(todo);

  Future<int> countRecord() async => _dbManager.countRecord();
}
