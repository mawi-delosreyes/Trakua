import 'package:frontend/database/dao/LocalInitDao.dart';
import 'package:frontend/model/ProfileDetails.dart';
import 'package:frontend/repository/LocalInitRepo.dart';
import 'package:sqflite/sqflite.dart';

class LocalInitRepoImpl implements LocalInitRepo{

  LocalInitRepoImpl(): super();
  final LocalInitDao localInitDao = LocalInitDao();

  @override  
  Future<Database> initializeDB() async {
    Future existingDB = LocalInitDao().dbHelper.checkExistingDB();

    if (existingDB == false) {
      return LocalInitDao().dbHelper.createDatabase();
    } else{
      return LocalInitDao().dbHelper.database;
    }
  }
}