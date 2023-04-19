import 'dart:convert';

class UserDTO {
  String username;
  String fullName;
  String? phoneNumber;
  String email;
  String password;
  String birthDate;

  UserDTO({
    required this.username,
    this.phoneNumber,
    required this.email,
    required this.fullName,
    required this.password,
    required this.birthDate,
  });

  Map<String, dynamic> toMap() {
    return {
      "account": {
        "email":email,
        "username":username,
        "phone_number":phoneNumber,
        "password":password,
      },
      "profile": {
        "full_name":fullName,
        "birth_date":birthDate,
      }
    };
  }

  factory UserDTO.fromMap(Map<String, dynamic> map) {
    return UserDTO(
      username: map['username'] ?? '',
      phoneNumber: map['phone_number'],
      email: map['email'] ?? '',
      password: map['password'] ?? '',
      birthDate: map['birth_date'] ?? '',
      fullName: map['full_name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserDTO.fromJson(String source) =>
      UserDTO.fromMap(json.decode(source));
}

class User extends UserDTO {
  final int id;
  final String token;
  final String createdAt;

  User({
    required this.id,
    required this.token,
    required this.createdAt,
    required String username,
    required String? phoneNumber,
    required String fullName,
    required String email,
    required String birthDate,
  }) : super(
          username: username,
          phoneNumber: phoneNumber,
          email: email,
          fullName: fullName,
          password: '',
          birthDate: birthDate,
        );

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'phone_number': phoneNumber,
      'created_at':createdAt,
      'email': email,
      'password': password,
      'token': token,
    };
  }

  @override
  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] ?? -1,
      fullName: map['full_name'] ?? '',
      createdAt: map['created_at']??'',
      username: map['username'] ?? '',
      phoneNumber: map['phone_number'] ?? '',
      birthDate: map['birth_date'] ?? '',
      email: map['email'] ?? '',
      token: map['token'] ?? '',
    );
  }

  @override
  String toJson() => json.encode(toMap());

  @override
  factory User.fromJson(String source) => User.fromMap(json.decode(source));
}
