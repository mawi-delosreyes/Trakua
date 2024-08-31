class Fields {
  static const String sub_envelope_id = "envelope_id";
  static const String sub_envelope_name = "envelope_name";
  static const String sub_envelope_total_balance = "envelope_total_balance";
  static const String sub_envelope_balance = "envelope_balance";
  static const String envelope_id = "envelope_id";
  static const String category = "category";
  static const String roll_over = "roll_over";
  static const String last_sync = "last_sync";


  static const List<String> values = [sub_envelope_id, sub_envelope_name, sub_envelope_total_balance, sub_envelope_balance, envelope_id, category, roll_over, last_sync];
}

class SubEnvelope {
  final int sub_envelope_id;
  final String sub_envelope_name;
  final double sub_envelope_total_balance;
  final double sub_envelope_balance;
  final int envelope_id;
  final String category;
  final int roll_over;
  final int last_sync;

  SubEnvelope({
    required this.sub_envelope_id,
    required this.sub_envelope_name,
    required this.sub_envelope_total_balance,
    required this.sub_envelope_balance,
    required this.envelope_id,
    required this.category,
    required this.roll_over,
    required this.last_sync
  });

  Map<String, dynamic> toMap(){
    return {
      Fields.sub_envelope_id: sub_envelope_id,
      Fields.sub_envelope_name: sub_envelope_name,
      Fields.sub_envelope_total_balance: sub_envelope_total_balance,
      Fields.sub_envelope_balance: sub_envelope_balance,
      Fields.envelope_id: envelope_id,
      Fields.category: category,
      Fields.roll_over: roll_over,
      Fields.last_sync: last_sync
    };
  }

  factory SubEnvelope.fromMap(Map<String, dynamic> map) {
    return SubEnvelope(
      sub_envelope_id: map["sub_envelope_id"] as int, 
      sub_envelope_name: map["sub_envelope_name"] as String, 
      sub_envelope_total_balance: map["sub_envelope_total_balance"] as double, 
      sub_envelope_balance: map["sub_envelope_balance"] as double,
      envelope_id: map["envelope_id"] as int,
      category: map["category"] as String,
      roll_over: map["roll_over"] as int,
      last_sync: map["last_sync"] as int
    );
  }
}

