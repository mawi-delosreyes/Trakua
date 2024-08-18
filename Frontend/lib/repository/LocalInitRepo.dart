import 'package:frontend/model/ProfileDetails.dart';
import 'package:sqflite/sqflite.dart';

abstract class LocalInitRepo {
  Future<Database> initializeDB();
}

abstract class InitUser {
  Map<String, Object> initializeUser();
}