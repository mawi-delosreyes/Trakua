import 'package:sqflite/sqflite.dart';

class WalletTable {
  static void createTable(Database database, int version) async {
    await database.execute('''
      CREATE TABLE Wallets (
          wallet_id INTEGER PRIMARY KEY AUTOINCREMENT,
          user_id INTEGER,
          wallet_name TEXT, 
          last_sync INTEGER
      );
    ''');
  }

  static void insertWallet(Database database, Map<String, Object> insertWalletMap) async {
    await database.insert(
      "Wallets", insertWalletMap
    );
  } 
}
