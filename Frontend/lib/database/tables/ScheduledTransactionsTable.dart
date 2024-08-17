import 'package:sqflite/sqflite.dart';

class ScheduledTransactionsTable {
  static void createTable(Database database, int version) async {
    await database.execute('''
      CREATE TABLE Scheduled_Transactions (
          scheduled_transaction_id INTEGER PRIMARY KEY AUTOINCREMENT,
          envelope_id INTEGER,
          sub_envelope_id INTEGER,
          scheduled_date INTEGER, 
          transaction_amount REAL,
          notes TEXT,
          transaction_type TEXT,
          account_id INTEGER,
          from_envelope_id INTEGER,
          is_transfer NUMERIC,
          from_sub_envelope_id INTEGER,
          last_sync INTEGER
      );
    ''');
  }

  static void insertScheduledTransaction(Database database, Map<String, Object> insertScheduledTransactionsMap) async {
    await database.insert(
      "Scheduled_Transactions", insertScheduledTransactionsMap
    );
  } 
}
