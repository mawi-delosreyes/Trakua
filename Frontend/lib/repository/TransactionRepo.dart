import 'package:frontend/database/dao/ChibaoDao.dart';
import 'package:frontend/model/Envelope.dart';
import 'package:frontend/model/Transactions.dart';
import 'package:sqflite/sqflite.dart';

class TransactionRepo{
  ChibaoDao chibaoDao = ChibaoDao();

  Future<List<Transactions>> getEnvelopes() async {
    Database db = await chibaoDao.dbHelper.getDatabase;
    final transactionList = await db.rawQuery("SELECT * FROM Transactions");
    return transactionList.map((element) => Transactions.fromMap(element)).toList();
  }

  Future<int> saveNewTransaction(Map<String, Object?>transactionMap) async {
    Database db = await chibaoDao.dbHelper.getDatabase;
    return await db.insert("Transactions", transactionMap);
  }


  Future<int> updateExistingTransaction(Map<String, Object?>transactionMap) async {
    int transactionId = transactionMap["transaction_id"] as int;

    Database db = await chibaoDao.dbHelper.getDatabase;

    return await db.update(
      "Transactions", 
      transactionMap,
      where: 'transaction_id=?',
      whereArgs: [transactionId]
      );
  }
}