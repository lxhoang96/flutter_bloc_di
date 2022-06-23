import 'package:flutter_bloc_di/app/data/data_interfaces/local_interfaces.dart';
import 'package:sqflite/sqflite.dart';

class SqliteModule implements SqliteInterfaces{
  final int _defaultVersion = 1;

  // make this a singleton class
  SqliteModule._privateConstructor();
  static final SqliteModule instance = SqliteModule._privateConstructor();

  static Future<bool> databaseExists(String path) =>
      databaseFactory.databaseExists(path);

  Future<Database> getDatabase(String _dbName) async {
    if (await databaseExists(_dbName)) return openDatabase(_dbName);
    Database _database = await _initDatabase(_dbName);
    return _database;
  }

  /// this opens the database (and creates it if it doesn't exist)
  _initDatabase(String _name) async {
    return await openDatabase(_name, version: _defaultVersion);
  }

  // SQL code to create the database table
  Future createTable(
      Database db, List<Map<String, String>> querySentences) async {
    querySentences.forEach((element) async {
      String eachQuery = '';
      element.forEach((key, value) {
        eachQuery = eachQuery + '$key $value,';
      });
      await db.execute('''
          $eachQuery
          ''');
    });
  }

  Future dropTable(Database db, String tableName) async {
    await db.execute('DROP TABLE IF EXISTS $tableName');
  }
}
