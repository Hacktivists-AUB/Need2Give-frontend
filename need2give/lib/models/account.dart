import 'dart:convert';
import 'package:need2give/services/auth_service.dart';

class Account {
  final int id;
  final String username;
  final String email;
  String? phoneNumber;
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
    this.id = 0,
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
