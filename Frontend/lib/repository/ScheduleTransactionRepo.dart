import 'package:frontend/database/dao/ChibaoDao.dart';
import 'package:frontend/model/Envelope.dart';
import 'package:frontend/model/ScheduledTransaction.dart';
import 'package:frontend/model/Transactions.dart';
import 'package:sqflite/sqflite.dart';

class ScheduledTransactionRepo{
  ChibaoDao chibaoDao = ChibaoDao();

  Future<List<ScheduledTransactions>> getScheduledTransactions() async {
    Database db = await chibaoDao.dbHelper.getDatabase;
    final scheduledTransactionList = await db.rawQuery(
      '''SELECT DISTINCT st.scheduled_transaction_id, st.envelope_id, e.envelope_name, st.sub_envelope_id, se.sub_envelope_name, 
      st.scheduled_date, st.transaction_amount, st.notes, st.transaction_type, st.account_id, st.from_envelope_id, st.is_transfer, 
      st.from_sub_envelope_id, st.last_sync FROM Scheduled_Transactions st 
      INNER JOIN Envelopes e ON st.envelope_id=e.envelope_id 
      INNER JOIN Sub_Envelopes se ON st.sub_envelope_id=se.sub_envelope_id'''
    );
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