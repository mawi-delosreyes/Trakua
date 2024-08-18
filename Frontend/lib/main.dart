import 'package:flutter/material.dart';
import 'screens/TemplateScreen.dart';
import 'screens/ProfileScreen.dart';
import 'screens/WalletScreen.dart';
import 'package:frontend/repository/LocalInitRepoImpl.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initialize().initState();
  Map<String, Object?> user_map = await initialize().initializeUser();
  int? user_id = user_map["user_id"] as int;
  runApp(
    WalletScreen(user_id: user_id)
  );
}

class initialize {
  void initState() {
    LocalInitRepoImpl().initializeDB();
  }

  Future<Map<String, Object?>> initializeUser() {
    return LocalInitRepoImpl().initializeUser();
  }
}
