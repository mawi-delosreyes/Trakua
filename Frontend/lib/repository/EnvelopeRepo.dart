import 'package:frontend/database/dao/ChibaoDao.dart';
import 'package:frontend/model/Envelope.dart';
import 'package:sqflite/sqflite.dart';

class EnvelopeRepo{
  ChibaoDao chibaoDao = ChibaoDao();

  Future<List<Envelope>> getEnvelopes() async {
    Database db = await chibaoDao.dbHelper.getDatabase;
    final envelopeList = await db.rawQuery("SELECT * FROM Envelopes");
    return envelopeList.map((element) => Envelope.fromMap(element)).toList();
  }

  Future<int> saveNewEnvelope(Map<String, Object?>envelopeMap) async {
    Database db = await chibaoDao.dbHelper.getDatabase;
    return await db.insert("Envelopes", envelopeMap);
  }

  Future<List<Envelope>> getSpecificEnvelope(int envelopeId) async{
    Database db = await chibaoDao.dbHelper.getDatabase;
    final envelopeInfo = await db.rawQuery("SELECT * FROM Envelopes WHERE envelope_id=$envelopeId LIMIT 1");
    return envelopeInfo.map((element) => Envelope.fromMap(element)).toList();
  }

  Future<int> updateExistingEnvelope(Map<String, Object?>envelopeMap) async {
    int envelopeId = envelopeMap["envelope_id"] as int;

    Database db = await chibaoDao.dbHelper.getDatabase;

    return await db.update(
      "Envelopes", 
      envelopeMap,
      where: 'envelope_id=?',
      whereArgs: [envelopeId]
      );
  }
}