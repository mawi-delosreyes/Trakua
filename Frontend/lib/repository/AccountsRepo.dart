import 'package:frontend/database/dao/ChibaoDao.dart';
import 'package:frontend/model/Wallet.dart';
import 'package:sqflite/sqflite.dart';

class AccountsRepo{
  ChibaoDao chibaoDao = ChibaoDao();

  Future<int> saveNewAccount(Map<String, Object?>accountMap) async {
    Database db = await chibaoDao.dbHelper.getDatabase;
    return await db.insert("Accounts", accountMap);
  }
}