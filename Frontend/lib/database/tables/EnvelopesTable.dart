import 'package:sqflite/sqflite.dart';

class EnvelopesTable {
  static void createTable(Database database, int version) async {
    await database.execute('''
      CREATE TABLE Envelopes (
          envelope_id INTEGER PRIMARY KEY AUTOINCREMENT,
          envelope_name TEXT,
          user_id INTEGER,
          envelope_total_balance REAL, 
          envelope_balance REAL,
          envelope_type TEXT,
          number_of_sub_envelope INTEGER,
          last_sync INTEGER
      );
    ''');
  }

  static void insertEnvelope(Database database, Map<String, Object> insertEnvelopesMap) async {
    await database.insert(
      "Envelopes", insertEnvelopesMap
    );
  } 
}
