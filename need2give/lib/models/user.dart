import 'dart:convert';

class UserDTO {
  String username;
  String? phoneNumber;
  String email;
  String password;

  UserDTO({
    required this.username,
    this.phoneNumber,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'phone_number': phoneNumber,
      'email': email,
      'password': password,
    };
  }

  factory UserDTO.fromMap(Map<String, dynamic> map) {
    return UserDTO(
      username: map['username'] ?? '',
      phoneNumber: map['phone_number'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserDTO.fromJson(String source) =>
      UserDTO.fromMap(json.decode(source));
}

class User extends UserDTO {
  final int id;
  final String token;

  User({
    required this.id,
    required this.token,
    required String username,
    required String? phoneNumber,
    required String email,
    required String password,
  }) : super(
          username: username,
          phoneNumber: phoneNumber,
          email: email,
          password: "",
        );

  @override
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

  @override
  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] ?? -1,
      username: map['username'] ?? '',
      phoneNumber: map['phone_number'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
      token: map['token'] ?? '',
    );
  }

  @override
  String toJson() => json.encode(toMap());

  @override
  factory User.fromJson(String source) => User.fromMap(json.decode(source));
}
