class Fields {
  static const String scheduled_transaction_id = "scheduled_transaction_id";
  static const String envelope_id = "envelope_id";
  static const String sub_envelope_id = "sub_envelope_id";
  static const String scheduled_date = "scheduled_date";
  static const String transaction_amount = "transaction_amount";
  //static const String category = "cateogry";
  static const String notes = "notes";
  static const String transaction_type = "transaction_type";
  static const String account_id = "account_id";
  static const String from_envelope_id = "from_envelope_id";
  static const String is_transfer = "is_transfer";
  static const String from_sub_envelope_id = "from_sub_envelope_id";
  static const String last_sync = "last_sync";


  static const List<String> values = [scheduled_transaction_id, envelope_id, sub_envelope_id, scheduled_date, transaction_amount, notes, transaction_type, account_id, from_envelope_id, is_transfer, from_sub_envelope_id, last_sync];
}

class ScheduledTransactions {
  final int scheduled_transaction_id;
  final int envelope_id;
  final int sub_envelope_id;
  final int scheduled_date;
  final double transaction_amount;
  //final String category;
  final String notes;
  final String transaction_type;
  final int account_id;
  var from_envelope_id;
  final int is_transfer;
  var from_sub_envelope_id;
  final int last_sync;

  ScheduledTransactions({
    required this.scheduled_transaction_id,
    required this.envelope_id,
    required this.sub_envelope_id,
    required this.scheduled_date,
    required this.transaction_amount,
    //required this.category,
    required this.notes,
    required this.transaction_type,
    required this.account_id,
    this.from_envelope_id = null,
    required this.is_transfer,
    this.from_sub_envelope_id = null,
    required this.last_sync
  });

  Map<String, dynamic> toMap(){
    return {
      Fields.scheduled_transaction_id: scheduled_transaction_id,
      Fields.envelope_id: envelope_id,
      Fields.sub_envelope_id: sub_envelope_id,
      Fields.scheduled_date: scheduled_date,
      Fields.transaction_amount: transaction_amount,
      //Fields.category: category,
      Fields.notes: notes,
      Fields.transaction_type: transaction_type,
      Fields.account_id: account_id,
      Fields.from_envelope_id: from_envelope_id,
      Fields.is_transfer: is_transfer,
      Fields.from_sub_envelope_id: from_sub_envelope_id,
      Fields.last_sync: last_sync
    };
  }

  factory ScheduledTransactions.fromMap(Map<String, dynamic> map) {
    return ScheduledTransactions(
      scheduled_transaction_id: map["scheduled_transaction_id"] as int,
      envelope_id: map["envelope_id"] as int,
      sub_envelope_id: map["sub_envelope_id"] as int,
      scheduled_date: map["scheduled_date"] as int,
      transaction_amount: map["transaction_amount"] as double,
      //category: map["cateogry"] as String,
      notes: map["notes"] as String,
      transaction_type: map["transaction_type"] as String,
      account_id: map["account_id"] as int,
      from_envelope_id: map["from_envelope_id"],
      is_transfer: map["is_transfer"] as int,
      from_sub_envelope_id: map["from_sub_envelope_id"],
      last_sync: map["last_sync"] as int
    );
  }
}

