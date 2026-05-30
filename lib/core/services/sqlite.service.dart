import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Sqliteservice {
  Database? database;
  final String dbName = "emarket3.db";

  Future<Database?>? init() async {
    if(database != null){
      return database;
    }
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, dbName);

    database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(
          'CREATE TABLE carts (id INTEGER PRIMARY KEY, name TEXT, date TEXT)');
      await db.execute(
          'CREATE TABLE products (id INTEGER PRIMARY KEY, name TEXT, image TEXT, cart_id INTEGER, checked INTEGER DEFAULT 0)');
          
    });
    return null;
  }
}
