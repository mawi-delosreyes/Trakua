class Fields {
  static const String envelope_id = "envelope_id";
  static const String envelope_name = "envelope_name";
  static const String user_id = "user_id";
  static const String envelope_total_balance = "envelope_total_balance";
  static const String envelope_balance = "envelope_balance";
  static const String envelope_type = "envelope_type";
  static const String last_sync = "last_sync";


  static const List<String> values = [envelope_id, envelope_name, user_id, envelope_total_balance, envelope_balance, envelope_type, last_sync];
}

class Envelope {
  final int envelope_id;
  final String envelope_name;
  final int user_id;
  final double envelope_total_balance;
  final double envelope_balance;
  final String envelope_type;
  final int last_sync;

  Envelope({
    required this.envelope_id,
    required this.envelope_name,
    required this.user_id,
    required this.envelope_total_balance,
    required this.envelope_balance,
    required this.envelope_type,
    required this.last_sync
  });

  Map<String, dynamic> toMap(){
    return {
      Fields.envelope_id: envelope_id,
      Fields.envelope_name: envelope_name,
      Fields.user_id: user_id,
      Fields.envelope_total_balance: envelope_total_balance,
      Fields.envelope_balance: envelope_balance,
      Fields.envelope_type: envelope_type,
      Fields.last_sync: last_sync
    };
  }

  factory Envelope.fromMap(Map<String, dynamic> map) {
    return Envelope(
      envelope_id: map["envelope_id"] as int, 
      envelope_name: map["envelope_name"] as String, 
      user_id: map["user_id"] as int, 
      envelope_total_balance: map["account_balance"] as double,
      envelope_balance: map["account_total_balance"] as double,
      envelope_type: map["envelope_type"] as String,
      last_sync: map["last_sync"] as int
    );
  }
}

