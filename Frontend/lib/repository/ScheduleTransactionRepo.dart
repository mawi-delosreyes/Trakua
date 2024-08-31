import 'package:frontend/database/dao/ChibaoDao.dart';
import 'package:frontend/model/Envelope.dart';
import 'package:frontend/model/ScheduledTransaction.dart';
import 'package:frontend/model/Transactions.dart';
import 'package:sqflite/sqflite.dart';

class ScheduledTransactionRepo{
  ChibaoDao chibaoDao = ChibaoDao();

  Future<List<ScheduledTransactions>> getEnvelopes() async {
    Database db = await chibaoDao.dbHelper.getDatabase;
    final scheduledTransactionList = await db.rawQuery("SELECT * FROM Scheduled_Transactions");
    return scheduledTransactionList.map((element) => ScheduledTransactions.fromMap(element)).toList();
  }

  Future<int> saveNewTransaction(Map<String, Object?>scheduledTransactionMap) async {
    Database db = await chibaoDao.dbHelper.getDatabase;
    return await db.insert("Scheduled_Transactions", scheduledTransactionMap);
  }


  Future<int> updateExistingTransaction(Map<String, Object?>scheduledTransactionMap) async {
    int scheduledTransactionId = scheduledTransactionMap["scheduled_transaction_id"] as int;

    Database db = await chibaoDao.dbHelper.getDatabase;

    return await db.update(
      "Scheduled_Transactions", 
      scheduledTransactionMap,
      where: 'scheduled_transaction_id=?',
      whereArgs: [scheduledTransactionId]
      );
  }
}