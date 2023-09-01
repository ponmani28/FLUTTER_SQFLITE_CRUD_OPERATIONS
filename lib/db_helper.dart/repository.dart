import 'package:crud/db_helper.dart/database_connection.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class Repository {
  late DatabaseConnection _databaseConnection;
  Repository(){
    _databaseConnection= DatabaseConnection();  } 

  static Database? _database;
  Future<Database?> get database async{
    if (_database != null) {
      return _database; 
    }else{
      _database= await _databaseConnection.setDatabase();
      return _database;
    }
  }

//INSERT USER

insertData(table,data) async{var connection = await database;
 return await connection?.insert(table, data); 
}

//  READ ALL RECORD

readData(table) async {
  var connection = await database;
  return await connection?.query(table);
}

//READ A SINGLE RECORD BY ID

readDatabById(table,itemId) async {
  var connection = await database;
  return await connection?.query(table,where: 'id=?',whereArgs: [itemId]);
}

//UPDATE USER 

UpdateData(table,data) async {
  var connection =await database;
  return await connection?.update(table,data,where: 'id=?',whereArgs: [data['id']]);
}

//DELETE USER
deleteDataById(table,itemId) async{
  var connection = await database;
  return await connection?.rawDelete("delete from $table where id=$itemId");
}
}

