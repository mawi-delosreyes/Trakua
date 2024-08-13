import 'package:sqflite/sqflite.dart';

class ProfileDetailsTable {
  static void createTable(Database database, int version) async {
    await database.execute('''
      CREATE TABLE Profile_Details (
          user_id INTEGER PRIMARY KEY
          first_name TEXT
          last_name TEXT 
          email_address TEXT
          password TEXT
          currency TEXT
          savings_goal REAL
          profile_picture BLOB
          start_time_period INTEGER
          end_time_period INTEGER
      );
    ''');
  }
}