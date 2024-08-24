import 'package:frontend/database/dao/ChibaoDao.dart';
import 'package:sqflite/sqflite.dart';

class LocalInitRepo{

  LocalInitRepo(): super();
  final ChibaoDao localInitDao = ChibaoDao();

  Future<Database> initializeDB() async {
    return ChibaoDao().dbHelper.getDatabase;
  }

  Future<Map<String, Object?>> initializeUser() async {
    Database db = await ChibaoDao().dbHelper.getDatabase;
    final details = await db.rawQuery("SELECT user_id FROM Profile_Details");
    return details.first;
  }
}