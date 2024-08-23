import 'package:frontend/database/dao/ChibaoDao.dart';
import 'package:frontend/model/Wallet.dart';
import 'package:sqflite/sqflite.dart';

class WalletRepo{
  ChibaoDao chibaoDao = ChibaoDao();

  Future<List<Wallet>> getWallets() async {
    Database db = await chibaoDao.dbHelper.getDatabase;
    final walletList = await db.rawQuery("SELECT * FROM Wallets");
    return walletList.map((element) => Wallet.fromMap(element)).toList();
  }

  Future<int> saveNewWallet(Map<String, Object?>walletMap) async {
    Database db = await chibaoDao.dbHelper.getDatabase;
    return await db.insert("Wallets", walletMap);
  }

  Future<List<Wallet>> getSpecificWallet(int wallet_id) async{
    Database db = await chibaoDao.dbHelper.getDatabase;
    final walletInfo = await db.rawQuery("SELECT * FROM Wallets WHERE wallet_id=$wallet_id LIMIT 1");
    return walletInfo.map((element) => Wallet.fromMap(element)).toList();
  }

  Future<int> updateExistingWallet(Map<String, Object?>walletMap) async {
    int wallet_id = walletMap["wallet_id"] as int;

    Database db = await chibaoDao.dbHelper.getDatabase;

    return await db.update(
      "Wallets", 
      walletMap,
      where: 'wallet_id=?',
      whereArgs: [wallet_id]
      );
  }

}