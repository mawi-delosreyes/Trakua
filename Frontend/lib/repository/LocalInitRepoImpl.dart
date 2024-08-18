import 'package:frontend/database/dao/ChibaoDao.dart';
import 'package:frontend/model/ProfileDetails.dart';
import 'package:frontend/repository/LocalInitRepo.dart';
import 'package:sqflite/sqflite.dart';

class LocalInitRepoImpl implements LocalInitRepo{

  LocalInitRepoImpl(): super();
  final ChibaoDao localInitDao = ChibaoDao();

  @override  
  Future<Database> initializeDB() async {
    return ChibaoDao().dbHelper.getDatabase;
  }

  @override
  Future<Map<String, Object?>> initializeUser() async {
    Database db = await ChibaoDao().dbHelper.getDatabase;
    final details = await db.rawQuery("SELECT user_id FROM Profile_Details");
    return details.first;
  }
}