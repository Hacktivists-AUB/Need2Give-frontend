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

// TODO: dis has to be handled later
class ProfileData extends Profile {
  final int id;
  final String token;
  final String createdAt;

  ProfileData({
    required this.id,
    required this.token,
    required this.createdAt,
    required String username,
    required String? phoneNumber,
    required String email,
  }) : super(
          username: username,
          phoneNumber: phoneNumber,
          email: email,
          password: '',
        );

    @override
    Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'phone_number': phoneNumber,
      'created_at': createdAt,
      'email': email,
      'password': password,
      'token': token,
    };
  }

  factory ProfileData.fromMap(Map<String, dynamic> map) {
    return ProfileData(
      id: map['id'] ?? -1,
      createdAt: map['created_at'] ?? '',
      username: map['username'] ?? '',
      phoneNumber: map['phone_number'] ?? '',
      email: map['email'] ?? '',
      token: map['token'] ?? '',
    );
  }

  @override
  String toJson() => json.encode(toMap());

  factory ProfileData.fromJson(String source) => ProfileData.fromMap(json.decode(source));
}
