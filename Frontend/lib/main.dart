import 'package:flutter/material.dart';
import 'screens/TemplateScreen.dart';
import 'screens/ProfileScreen.dart';
import 'screens/WalletScreen.dart';
import 'package:frontend/repository/LocalInitRepoImpl.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initialize().initState();
  runApp(
    const WalletScreen()
  );
}

class initialize {
  void initState() {
    LocalInitRepoImpl().initializeDB();
  }
}
