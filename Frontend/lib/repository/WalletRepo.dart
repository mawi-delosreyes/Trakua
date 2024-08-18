import 'package:frontend/model/Wallet.dart';
import 'package:sqflite/sqflite.dart';

abstract class WalletRepo {
  Future<List<Wallet>> getWallets();
}