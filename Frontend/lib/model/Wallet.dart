
class Fields {
  static const String wallet_id = "wallet_id";
  static const String user_id = "user_id";
  static const String wallet_name = "wallet_name";
  static const String last_sync = "last_sync";

  static const List<String> values = [wallet_id, user_id, wallet_name, last_sync];
}

class Wallet {
  final int wallet_id;
  final int user_id;
  final String wallet_name;
  final String last_sync;

  Wallet({
    required this.wallet_id,
    required this.user_id,
    required this.wallet_name,
    this.last_sync = ""
  });

  Map<String, dynamic> toMap(){
    return {
      Fields.wallet_id: wallet_id,
      Fields.user_id: user_id,
      Fields.wallet_name: wallet_name,
      Fields.last_sync: last_sync
    };
  }

  factory Wallet.fromMap(Map<String, dynamic> map) {
    return Wallet(
      wallet_id: map["wallet_id"] as int, 
      user_id: map["user_id"] as int, 
      wallet_name: map["wallet_name"] as String, 
      last_sync: map["last_sync"] as String
    );
  }
}

