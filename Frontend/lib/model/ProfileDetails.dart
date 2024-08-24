class Fields {
  static const String user_id = "user_id";
  static const String first_name = "first_name";
  static const String last_name = "last_name";
  static const String email_address = "email_address";
  static const String currency = "currency";
  static const String savings_goal = "savings_goal";
  static const String start_time_period = "start_time_period";
  static const String end_time_period = "end_time_period";

  static const List<String> values = [user_id, first_name, last_name, email_address, currency, savings_goal, start_time_period, end_time_period];
}

class ProfileDetails {
  final int user_id;
  final String first_name;
  final String last_name;
  final String email_address;
  final String password;
  final String currency;
  final double savings_goal;
  final int start_time_period;
  final int end_time_period;

  ProfileDetails({
    required this.user_id,
    required this.first_name,
    required this.last_name,
    required this.email_address,
    this.password = "",
    required this.currency,
    required this.savings_goal,
    required this.start_time_period,
    required this.end_time_period
  });

  Map<String, dynamic> toMap(){
    return {
      Fields.user_id: user_id,
      Fields.first_name: first_name,
      Fields.last_name: last_name,
      Fields.email_address: email_address,
      Fields.currency: currency,
      Fields.savings_goal: savings_goal,
      Fields.start_time_period: start_time_period,
      Fields.end_time_period: end_time_period
    };
  }

  factory ProfileDetails.fromMap(Map<String, dynamic> map){
    return ProfileDetails(
      user_id: map["user_id"] as int,
      first_name: map["first_name"] as String,
      last_name: map["last_name"] as String,
      email_address: map["email_address"] as String,
      currency: map["currency"] as String,
      savings_goal: map["savings_goal"] as double,
      start_time_period: map["start_time_period"] as int,
      end_time_period: map["end_time_period"] as int
    );
  }
}