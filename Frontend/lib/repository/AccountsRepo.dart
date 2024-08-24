import 'package:frontend/database/dao/ChibaoDao.dart';
import 'package:frontend/model/Accounts.dart';
import 'package:frontend/model/Wallet.dart';
import 'package:sqflite/sqflite.dart';

class AccountsRepo{
  ChibaoDao chibaoDao = ChibaoDao();

  Future<int> saveNewAccount(Map<String, Object?>accountMap) async {
    Database db = await chibaoDao.dbHelper.getDatabase;
    return await db.insert("Accounts", accountMap);
  }

  Future<List<Accounts>> getAccounts(int wallet_id) async {
    Database db = await chibaoDao.dbHelper.getDatabase;
    final accounts = await db.rawQuery("SELECT * FROM Accounts WHERE wallet_id=$wallet_id");
    return accounts.map((element) => Accounts.fromMap(element)).toList();
  }

  Future<int> updateExistingAccount(Map<String, Object?>accountMap) async {
    print(accountMap);
    int account_id = accountMap["account_id"] as int;

    Database db = await chibaoDao.dbHelper.getDatabase;

    return await db.update(
      "Accounts", 
      accountMap,
      where: 'account_id=?',
      whereArgs: [account_id]
      );
  }

}