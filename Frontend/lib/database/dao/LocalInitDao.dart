import 'package:frontend/database/Database.dart';


class LocalInitDao {
  final ChibaoDatabase dbHelper;

  LocalInitDao([ChibaoDatabase? dbHelper])
      : dbHelper = dbHelper ?? ChibaoDatabase.dbHelper;
}