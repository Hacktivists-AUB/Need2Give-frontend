import 'dart:convert';

class User {
  final String id;
  final String username;
  String? phoneNumber;
  final String email;
  final String password;
  final String token;

  User({
    required this.id,
    required this.username,
    required this.email,
    this.phoneNumber = '',
    required this.password,
    required this.token,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'phone_number': phoneNumber,
      'email': email,
      'password': password,
      'token': token,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] ?? '',
      username: map['username'] ?? '',
      phoneNumber: map['phone_number'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
      token: map['token'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));
}
