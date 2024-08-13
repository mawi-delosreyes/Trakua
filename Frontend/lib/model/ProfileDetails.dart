import 'dart:ffi';
import 'dart:typed_data';

class Profile_Details {
  final int user_id;
  final String first_name;
  final String last_name;
  final String email_address;
  final String password;
  final String currency;
  final double savings_goal;
  final TypedData profile_picture;
  final Long start_time_period;
  final Long end_time_period;

  const Profile_Details({
    required this.user_id,
    required this.first_name,
    required this.last_name,
    required this.email_address,
    required this.password,
    required this.currency,
    required this.savings_goal,
    required this.profile_picture,
    required this.start_time_period,
    required this.end_time_period
  });
}