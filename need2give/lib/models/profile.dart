import 'dart:convert';
import 'package:need2give/services/auth_service.dart';

class Profile {
  final String username;
  final String email;
  final String? phoneNumber;
  final String password;
  final AccountType type;

  Profile({
    required this.username,
    required this.email,
    this.phoneNumber,
    required this.password,
    this.type = AccountType.none,
  });

  Map<String, dynamic> toMap() {
    return {
      "email": email,
      "username": username,
      "phone_number": phoneNumber,
      "password": password,
    };
  }

  String toJson() => json.encode(toMap());
}
