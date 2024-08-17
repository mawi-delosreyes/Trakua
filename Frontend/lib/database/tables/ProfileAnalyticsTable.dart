import 'package:sqflite/sqflite.dart';

class ProfileAnalyticsTable {
  static void createTable(Database database, int version) async {
    await database.execute('''
      CREATE TABLE Profile_Analytics (
          user_analytics_id INTEGER PRIMARY KEY AUTOINCREMENT,
          user_id INTEGER,
          analytics_date INTEGER,
          needs REAL, 
          wants REAL,
          savings REAL,
          last_sync INTEGER
      );
    ''');
  }

  static void insertProfileAnalytics(Database database, Map<String, Object> insertProfileAnalyticsMap) async {
    await database.insert(
      "Profile_Analytics", insertProfileAnalyticsMap
    );
  } 
}
