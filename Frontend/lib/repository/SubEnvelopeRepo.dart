import 'package:frontend/database/dao/ChibaoDao.dart';
import 'package:frontend/model/SubEnvelope.dart';
import 'package:sqflite/sqflite.dart';

class SubEnvelopeRepo{
  ChibaoDao chibaoDao = ChibaoDao();

  Future<List<SubEnvelope>> getSubEnvelopes() async {
    Database db = await chibaoDao.dbHelper.getDatabase;
    final subEnvelopeList = await db.rawQuery("SELECT * FROM Sub_Envelopes");
    return subEnvelopeList.map((element) => SubEnvelope.fromMap(element)).toList();
  }

  Future<int> saveNewSubEnvelope(Map<String, Object?>subEnvelopeMap) async {
    Database db = await chibaoDao.dbHelper.getDatabase;
    return await db.insert("Sub_Envelopes", subEnvelopeMap);
  }

  Future<List<SubEnvelope>> getSpecificSubEnvelope(int subEnvelopeId) async{
    Database db = await chibaoDao.dbHelper.getDatabase;
    final subEnveloepInfo = await db.rawQuery("SELECT * FROM Sub_Envelopes WHERE sub_envelope_id=$subEnvelopeId LIMIT 1");
    return subEnveloepInfo.map((element) => SubEnvelope.fromMap(element)).toList();
  }

  Future<List<SubEnvelope>> getSubEnvelopeFromEnvelope(int envelopeId) async{
    Database db = await chibaoDao.dbHelper.getDatabase;
    final subEnvelopeList = await db.rawQuery("SELECT * FROM Sub_Envelopes WHERE envelope_id=$envelopeId");
    return subEnvelopeList.map((element) => SubEnvelope.fromMap(element)).toList();
  }
  Future<int> updateExistingSubEnvelope(Map<String, Object?>subEnvelopeMap) async {
    int subEnvelopeId = subEnvelopeMap["sub_envelope_id"] as int;

    Database db = await chibaoDao.dbHelper.getDatabase;

    return await db.update(
      "Sub_Envelopes", 
      subEnvelopeMap,
      where: 'sub_envelope_id=?',
      whereArgs: [subEnvelopeId]
      );
  }
}