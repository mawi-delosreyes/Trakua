import 'package:frontend/database/dao/ChibaoDao.dart';
import 'package:frontend/model/ProfileDetails.dart';
import 'package:sqflite/sqflite.dart';

class ProfileDetailsRepo{

  ChibaoDao chibaoDao = ChibaoDao();

  Future<List<ProfileDetails>> getProfileDetails(int userId) async {
    Database db = await chibaoDao.dbHelper.getDatabase;
    final details = await db.rawQuery("SELECT * FROM Profile_Details WHERE user_id = $userId");
    return details.map((element) => ProfileDetails.fromMap(element)).toList();
  }
}