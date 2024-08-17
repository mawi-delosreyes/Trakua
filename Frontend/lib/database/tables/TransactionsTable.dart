import 'package:sqflite/sqflite.dart';

class TransactionsTable {
  static void createTable(Database database, int version) async {
    await database.execute('''
      CREATE TABLE Transactions (
          transaction_id INTEGER PRIMARY KEY AUTOINCREMENT,
          envelope_id INTEGER,
          sub_envelope_id INTEGER,
          transaction_date INTEGER, 
          transaction_amount REAL,
          notes TEXT,
          transaction_type TEXT,
          account_id INTEGER,
          from_envelope_id INTEGER,
          is_transfer NUMERIC,
          from_sub_envelope_id INTEGER
      );
    ''');
  }

  static void insertTransaction(Database database, Map<String, Object> insertTransactionsMap) async {
    await database.insert(
      "Transactions", insertTransactionsMap
    );
  } 
}
