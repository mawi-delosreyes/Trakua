import 'package:frontend/database/dao/LocalInitDao.dart';
import 'package:frontend/model/ProfileDetails.dart';
import 'package:frontend/repository/LocalInitRepo.dart';
import 'package:sqflite/sqflite.dart';

class LocalInitRepoImpl implements LocalInitRepo{

  LocalInitRepoImpl(): super();
  final LocalInitDao localInitDao = LocalInitDao();

  @override  
  Future<Database> initializeDB() async {
    return LocalInitDao().dbHelper.getDatabase;
  }
}