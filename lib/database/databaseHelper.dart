import 'dart:io';

import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import './resultModel.dart';
import 'package:path/path.dart';
import 'dart:io' as io;

final String tablename = "newresTable";
final String columnid = "id";
final String resultString = "resultString";
final String date = "date";
final String month = "month";
final String year = "year";
final String hours = "hours";
final String minutes = "minutes";

class DBHelper {
  static Database? _db;

  DBHelper._();
  static final DBHelper instance = DBHelper._();

  Future<Database?> get db async {
    if (_db != null) return _db;
    _db = await _initDatabase();
    return _db;
  }

  _initDatabase() async {
    Directory dataDirectory = await getApplicationDocumentsDirectory();
    String dbPath = join(dataDirectory.path, "gameresult.db");
    return await openDatabase(dbPath, version: 1, onCreate: _onCreateDB);
  }

  _onCreateDB(Database db, int version) async {
    await db.execute('''
          create table $tablename ( 
          $columnid INTEGER PRIMARY KEY AUTOINCREMENT, 
          $resultString TEXT NOT NULL,
          $date TEXT NOT NULL,
          $month TEXT NOT NULL,
          $year TEXT NOT NULL,
          $hours TEXT NOT NULL,
          $minutes TEXT NOT NULL
          )

        ''');
  }

  Future<ResultModel> insert(ResultModel resultModel) async {
    var dbClient = await this.db;
    await dbClient!.insert("newresTable", resultModel.toJson());
    return resultModel;
  }

  Future<List<ResultModel>> getResultList() async {
    var dbClient = await this.db;
    final List<Map<String, Object?>> querryResult =
        await dbClient!.query("newresTable");

    return querryResult.map((e) => ResultModel.fromMap(e)).toList();
  }
}
