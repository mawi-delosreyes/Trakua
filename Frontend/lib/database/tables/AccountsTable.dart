import 'package:sqflite/sqflite.dart';

class AccountsTable {
  static void createTable(Database database, int version) async {
    await database.execute('''
      CREATE TABLE Accounts (
          account_id INTEGER PRIMARY KEY AUTOINCREMENT,
          wallet_id INTEGER,
          account_name TEXT, 
          account_balance REAL,
          last_sync INTEGER
      );
    ''');
  }

  static void insertWalletAccount(Database database, Map<String, Object> insertWalletAccountMap) async {
    await database.insert(
      "Accounts", insertWalletAccountMap
    );
  } 
}
