import 'package:frontend/database/Database.dart';


class ChibaoDao {
  final ChibaoDatabase dbHelper;

  ChibaoDao([ChibaoDatabase? dbHelper])
      : dbHelper = dbHelper ?? ChibaoDatabase.dbHelper;
}