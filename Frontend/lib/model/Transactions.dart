class Fields {
  static const String transaction_id = "transaction_id";
  static const String envelope_id = "envelope_id";
  static const String envelope_name = "envelope_name";
  static const String sub_envelope_id = "sub_envelope_id";
  static const String sub_envelope_name = "sub_envelope_name";
  static const String transaction_date = "transaction_date";
  static const String transaction_amount = "transaction_amount";
  //static const String category = "cateogry";
  static const String notes = "notes";
  static const String transaction_type = "transaction_type";
  static const String account_id = "account_id";
  static const String from_envelope_id = "from_envelope_id";
  static const String is_transfer = "is_transfer";
  static const String from_sub_envelope_id = "from_sub_envelope_id";


  static const List<String> values = [transaction_id, envelope_id, envelope_name, sub_envelope_id, sub_envelope_name, transaction_date, transaction_amount, notes, transaction_type, account_id, from_envelope_id, is_transfer, from_sub_envelope_id];
}

class Transactions {
  final int transaction_id;
  final int envelope_id;
  final String envelope_name;
  final int sub_envelope_id;
  final String sub_envelope_name;
  final int transaction_date;
  final double transaction_amount;
  //final String category;
  final String notes;
  final String transaction_type;
  final String account_id;
  var from_envelope_id;
  final int is_transfer;
  var from_sub_envelope_id;

  Transactions({
    this.transaction_id = 0,
    this.envelope_id = 0,
    this.envelope_name = "",
    this.sub_envelope_id = 0,
    this.sub_envelope_name = "",
    this.transaction_date = 0,
    this.transaction_amount = 0,
    //required this.category,
    this.notes = "",
    this.transaction_type = "",
    this.account_id = "",
    this.from_envelope_id = null,
    this.is_transfer = 1,
    this.from_sub_envelope_id = null
  });

  Map<String, dynamic> toMap(){
    return {
      Fields.transaction_id: transaction_id,
      Fields.envelope_id: envelope_id,
      Fields.envelope_name: envelope_name,
      Fields.sub_envelope_id: sub_envelope_id,
      Fields.sub_envelope_name: sub_envelope_name,
      Fields.transaction_date: transaction_date,
      Fields.transaction_amount: transaction_amount,
      //Fields.category: category,
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
      envelope_name: map["envelope_name"] as String,
      sub_envelope_id: map["sub_envelope_id"] as int,
      sub_envelope_name: map["sub_envelope_name"] as String,
      transaction_date: map["transaction_date"] as int,
      transaction_amount: map["transaction_amount"] as double,
      //category: map["cateogry"] as String,
      notes: map["notes"] as String,
      transaction_type: map["transaction_type"] as String,
      account_id: map["account_id"] as String,
      from_envelope_id: map["from_envelope_id"],
      is_transfer: map["is_transfer"] as int,
      from_sub_envelope_id: map["from_sub_envelope_id"]
    );
  }

  factory Transactions.sortedTransactionMap(Map<String, dynamic> map) {
    return Transactions(
      sub_envelope_name: map["sub_envelope_name"] as String,
      transaction_amount: map["transaction_amount"] as double
    );  
  }
}

