import 'package:sqflite/sqflite.dart';

class SubEnvelopesTable {
  static void createTable(Database database, int version) async {
    await database.execute('''
      CREATE TABLE Sub_Envelopes (
          sub_envelope_id INTEGER PRIMARY KEY AUTOINCREMENT,
          sub_envelope_name TEXT,
          sub_envelope_total_balance REAL, 
          sub_envelope_balance REAL,
          envelope_id INTEGER,
          category TEXT,
          roll_over INTEGER,
          last_sync INTEGER
      );
    ''');
  }

  static void insertSubEnvelope(Database database, Map<String, Object> insertSubEnvelopesMap) async {
    await database.insert(
      "Sub_Envelopes", insertSubEnvelopesMap
    );
  } 
}
