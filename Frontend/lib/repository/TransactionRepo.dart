import 'package:frontend/database/dao/ChibaoDao.dart';
import 'package:frontend/model/Envelope.dart';
import 'package:frontend/model/Transactions.dart';
import 'package:sqflite/sqflite.dart';

class TransactionRepo{
  ChibaoDao chibaoDao = ChibaoDao();

  Future<List<Transactions>> getTransactions() async {
    Database db = await chibaoDao.dbHelper.getDatabase;
    final transactionList = await db.rawQuery(
      '''SELECT DISTINCT t.transaction_id, t.envelope_id, e.envelope_name, t.sub_envelope_id, se.sub_envelope_name, 
      t.transaction_date, t.transaction_amount, t.notes, t.transaction_type, t.account_id, t.from_envelope_id, t.is_transfer, 
      t.from_sub_envelope_id FROM Transactions t 
      INNER JOIN Envelopes e ON t.envelope_id=e.envelope_id 
      INNER JOIN Sub_Envelopes se ON t.sub_envelope_id=se.sub_envelope_id'''
    );
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

  Future<List<Transactions>> getSortedSubEnvelopeTransactionAmount() async {
    Database db = await chibaoDao.dbHelper.getDatabase;
    final sortedTransactionList = await db.rawQuery(
      '''SELECT se.sub_envelope_name, SUM(t.transaction_amount) as transaction_amount FROM Transactions t 
      INNER JOIN Sub_Envelopes se ON t.sub_envelope_id=se.sub_envelope_id 
      GROUP BY t.sub_envelope_id ORDER BY SUM(t.transaction_amount) DESC LIMIT 3'''
    );
    return sortedTransactionList.map((element) => Transactions.sortedTransactionMap(element)).toList(); 
  }

  Future<List<Transactions>> getTransactionsBasedOnDate(int date) async {
    Database db = await chibaoDao.dbHelper.getDatabase;

    final sortedDateTransactionList = await db.rawQuery(
      '''SELECT DISTINCT t.transaction_id, t.envelope_id, e.envelope_name, t.sub_envelope_id, se.sub_envelope_name, 
      t.transaction_date, t.transaction_amount, t.notes, t.transaction_type, t.account_id, t.from_envelope_id, t.is_transfer, 
      t.from_sub_envelope_id FROM Transactions t 
      INNER JOIN Envelopes e ON t.envelope_id=e.envelope_id 
      INNER JOIN Sub_Envelopes se ON t.sub_envelope_id=se.sub_envelope_id 
      WHERE t.transaction_date<=${date} ORDER BY t.transaction_date LIMIT 10'''
    );
    return sortedDateTransactionList.map((element) => Transactions.fromMap(element)).toList();
  }
}