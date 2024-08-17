import 'package:frontend/model/ProfileDetails.dart';
import 'package:sqflite/sqflite.dart';

abstract class ProfileDetailsRepo {
  Future<List<ProfileDetails>> getProfileDetails();
}