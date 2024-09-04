import 'package:flutter/material.dart';
import 'package:frontend/screens/AllEnvelopeScreen.dart';
import 'package:frontend/screens/CreateEnvelopeScreen.dart';
import 'package:frontend/screens/CreateTransactionScreen.dart';
import 'package:frontend/widgets/CreateSubEnvelopePopup.dart';
import 'package:frontend/screens/LandingScreen.dart';
import 'screens/TemplateScreen.dart';
import 'screens/ProfileScreen.dart';
import 'screens/WalletScreen.dart';
import 'package:frontend/repository/LocalInitRepo.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initialize().initState();
  Map<String, Object?> user_map = await initialize().initializeUser();
  int? user_id = user_map["user_id"] as int;
  runApp(
    //CreateEnvelopeScreen(user_id: user_id)
    //CreateTransactionScreen(user_id: user_id)
    //LandingScreen(user_id: user_id)
    AllEnvelopeScreen(user_id: user_id)
  );
}

class initialize {
  void initState() {
    LocalInitRepo().initializeDB();
  }

  Future<Map<String, Object?>> initializeUser() {
    return LocalInitRepo().initializeUser();
  }
}
