import 'dart:developer';

import 'package:sqflite/sqflite.dart';
import 'package:to_do_app/features/tasks/data/model/task_model.dart';

class DataBaseHelper {
  late Database db;

  initDb() async {
    //open  the database
    await openDatabase(
      'task.db', //path
      version: 1, //version
      onOpen: (db) => log('database open'), //check if database is open
      onCreate: (db, version) async {
        //create Table
        await db.execute('''
          CREATE TABLE TASKS(
         // ID INTEGER PRIMARY KEY AUTOINCREMENT,
          title TEXT,
          note TEXT,
          date TEXT,
          startTime TEXT,
          endTime TEXT,
          complete INTEGER,
          color INTEGER
          )
        ''').then((val) => log('Created successfully'));
      },
    ).then((val) => db = val).catchError((error) => log(error.toString()));
  }

  //get all Task
  Future<List<Map<String, Object?>>> getAllTasks() async {
    return await db.rawQuery("SELECT * FROM TASKS");
  }

  //update task
  Future<int> updateTask(int id) async {
    int number1 = 1;
    return await db
        .rawUpdate('''UPDATE TASKS SET complete=$number1 WHERE id = $id ''');
  }

  // //delete task
  Future<int> deleteTask({required int id}) async {
    return await db.rawDelete("DELETE FROM TASKS WHERE ID =$id");
  }

  //insert task
  Future<int> insertTask({required TaskModel taskModel}) async {
    return await db.rawInsert(
        '''INSERT INTO TASKS(title,note,date,startTime,endTime,complete,color) VALUES 
        ("${taskModel.title}","${taskModel.note}","${taskModel.date}","${taskModel.startTime}","${taskModel.endTime}",${taskModel.complete},${taskModel.color} )''');
  }
}
/*ID INTEGER PRIMARY KEY AUTOINCREMENT,
          title TEXT,-
          note TEXT,-
          date TEXT,-
          startTime TEXT,-
          endTime TEXT,-
          complete INTEGER,-
          color INTEGER
           */