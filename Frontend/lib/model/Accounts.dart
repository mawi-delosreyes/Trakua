class Fields {
  static const String account_id = "wallet_id";
  static const String wallet_id = "wallet_id";
  static const String account_name = "account_name";
  static const String account_balance = "account_balance";

  static const List<String> values = [account_id, wallet_id, account_name, account_balance];
}

class Accounts {
  final int account_id;
  final int wallet_id;
  final String account_name;
  final double account_balance;

  Accounts({
    required this.account_id,
    required this.wallet_id,
    required this.account_name,
    required this.account_balance
  });

  Map<String, dynamic> toMap(){
    return {
      Fields.account_id: account_id,
      Fields.wallet_id: wallet_id,
      Fields.account_name: account_name,
      Fields.account_balance: account_balance
    };
  }

  factory Accounts.fromMap(Map<String, dynamic> map) {
    return Accounts(
      account_id: map["account_id"] as int, 
      wallet_id: map["wallet_id"] as int, 
      account_name: map["account_name"] as String, 
      account_balance: map["account_balance"] as double
    );
  }
}

