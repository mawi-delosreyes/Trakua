class Fields {
  static const String transaction_id = "transaction_id";
  static const String envelope_id = "envelope_id";
  static const String sub_envelope_id = "sub_envelope_id";
  static const String transaction_date = "transaction_date";
  static const String transaction_amount = "transaction_amount";
  static const String notes = "notes";
  static const String transaction_type = "transaction_type";
  static const String account_id = "account_id";
  static const String from_envelope_id = "from_envelope_id";
  static const String is_transfer = "is_transfer";
  static const String from_sub_envelope_id = "from_sub_envelope_id";


  static const List<String> values = [transaction_id, envelope_id, sub_envelope_id, transaction_date, transaction_amount, notes, transaction_type, account_id, from_envelope_id, is_transfer, from_sub_envelope_id];
}

class Transactions {
  final int transaction_id;
  final int envelope_id;
  final int sub_envelope_id;
  final int transaction_date;
  final double transaction_amount;
  final String notes;
  final String transaction_type;
  final int account_id;
  final int from_envelope_id;
  final int is_transfer;
  final int from_sub_envelope_id;

  Transactions({
    required this.transaction_id,
    required this.envelope_id,
    required this.sub_envelope_id,
    required this.transaction_date,
    required this.transaction_amount,
    required this.notes,
    required this.transaction_type,
    required this.account_id,
    required this.from_envelope_id,
    required this.is_transfer,
    required this.from_sub_envelope_id
  });

  Map<String, dynamic> toMap(){
    return {
      Fields.transaction_id: transaction_id,
      Fields.envelope_id: envelope_id,
      Fields.sub_envelope_id: sub_envelope_id,
      Fields.transaction_date: transaction_date,
      Fields.transaction_amount: transaction_amount,
      Fields.notes: notes,
      Fields.transaction_type: transaction_type,
      Fields.account_id: account_id,
      Fields.from_envelope_id: from_envelope_id,
      Fields.is_transfer: is_transfer,
      Fields.from_sub_envelope_id: from_sub_envelope_id
    };
  }

  factory Transactions.fromMap(Map<String, dynamic> map) {
    return Transactions(
      transaction_id: map["transaction_id"] as int,
      envelope_id: map["envelope_id"] as int,
      sub_envelope_id: map["sub_envelope_id"] as int,
      transaction_date: map["transaction_date"] as int,
      transaction_amount: map["transaction_amount"] as double,
      notes: map["notes"] as String,
      transaction_type: map["transaction_type"] as String,
      account_id: map["account_id"] as int,
      from_envelope_id: map["from_envelope_id"] as int,
      is_transfer: map["is_transfer"] as int,
      from_sub_envelope_id: map["from_sub_envelope_id"] as int
    );
  }
}

