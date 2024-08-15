import 'package:sqflite/sqflite.dart';

class ProfileDetailsTable {
  static void createTable(Database database, int version) async {
    await database.execute('''
      CREATE TABLE Profile_Details (
          user_id INTEGER PRIMARY KEY AUTOINCREMENT,
          first_name TEXT,
          last_name TEXT, 
          email_address TEXT,
          password TEXT,
          currency TEXT,
          savings_goal REAL,
          profile_picture BLOB,
          start_time_period INTEGER,
          end_time_period INTEGER
      );
    ''');
  }

  static void insertProfileDetails(Database database) async {
    await database.rawInsert('''
      INSERT INTO Profile_Details (
        first_name, last_name, email_address, password, currency, savings_goal, start_time_period, end_time_period
      ) VALUES(
        "Mark", "de los Reyes", "mwldelosreyes13@gmail.com", "1234abcd", "PHP", 100000, 15, 30 
      );
    ''');
  } 
}