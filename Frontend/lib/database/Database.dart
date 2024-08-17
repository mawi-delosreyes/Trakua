import 'dart:async';
import 'dart:io';

import 'package:frontend/database/tables/ProfileDetailsTable.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class ChibaoDatabase {

  static final ChibaoDatabase dbHelper = ChibaoDatabase();
  static const DATABASE_NAME = "LocalDB/Chibao_mobile.db";
  static const DATABASE_VERSION = 1;

  Future<String> generatePath() async {
    Directory directory = Platform.isIOS ? await getLibraryDirectory() : await getApplicationDocumentsDirectory();
    print(directory);
    return join(directory.path, DATABASE_NAME);
  }

  Database? _database;

  Future<Database> get getDatabase async {
    _database ??= await checkDB();
    return _database!;
  }

  Future<Database> checkDB() async {
    var database = await openDatabase(await generatePath(),
        version: DATABASE_VERSION, onCreate: initDB);
    return database;
  }

  void onUpgrade(Database database, int oldVersion, int newVersion) {
    if (newVersion > oldVersion) {}
  }

  void initDB(Database database, int version) async {
    ProfileDetailsTable.createTable(database, version);
    ProfileDetailsTable.insertProfileDetails(database);
  }
}
