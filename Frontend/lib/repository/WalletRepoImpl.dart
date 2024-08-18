import 'package:frontend/database/dao/ChibaoDao.dart';
import 'package:frontend/model/Wallet.dart';
import 'package:frontend/repository/WalletRepo.dart';
import 'package:sqflite/sqflite.dart';

class WalletRepoImpl implements WalletRepo{
  ChibaoDao chibaoDao = ChibaoDao();

  Future<List<Wallet>> getWallets() async {
    Database db = await chibaoDao.dbHelper.getDatabase;
    final walletList = await db.rawQuery("SELECT * FROM Wallets");
    return walletList.map((element) => Wallet.fromMap(element)).toList();
  }
}