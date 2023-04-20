import 'dart:convert';
import 'package:need2give/services/auth_service.dart';

class Account {
  final String username;
  final String email;
  final String? phoneNumber;
  final String password;
  final AccountType type;
  final String token;

  Account({
    required this.username,
    required this.email,
    this.phoneNumber,
    required this.password,
    this.type = AccountType.none,
    this.token = "",
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
