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
}