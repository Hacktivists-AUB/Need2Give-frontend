import 'dart:convert';
import 'package:need2give/models/account.dart';
import 'package:need2give/services/auth_service.dart';

class UserDTO extends Account {
  final String fullName;
  final String birthDate;

  UserDTO({
    required super.username,
    super.phoneNumber,
    required super.email,
    required this.fullName,
    required super.password,
    required this.birthDate,
    super.type = AccountType.user,
    super.token = "",
    super.id = 0,
  });

  @override
  Map<String, dynamic> toMap() {
    return {
      "account": super.toMap(),
      "profile": {
        "full_name": fullName,
        "birth_date": birthDate,
      }
    };
  }

  factory UserDTO.fromMap(Map<String, dynamic> map) {
    return UserDTO(
      username: map["username"] ?? "",
      phoneNumber: map["phone_number"],
      email: map["email"] ?? "",
      password: map["password"] ?? "",
      birthDate: map["birth_date"] ?? "",
      fullName: map["full_name"] ?? "",
    );
  }

  @override
  String toJson() => json.encode(toMap());

  factory UserDTO.fromJson(String source) =>
      UserDTO.fromMap(json.decode(source));
}

class User extends UserDTO {
  final String createdAt;

  User({
    required super.id,
    required super.token,
    required this.createdAt,
    required super.username,
    required super.phoneNumber,
    required super.fullName,
    required super.email,
    required super.birthDate,
    super.password = "",
  });

  @override
  Map<String, dynamic> toMap({bool expanded = true}) {
    return expanded
        ? {
            "id": id,
            "username": username,
            "email": email,
            "phone_number": phoneNumber,
            "created_at": createdAt,
            "full_name": fullName,
            "birth_date": birthDate,
            "token": token,
          }
        : {
            "account": {
              "id": id,
              "username": username,
              "email": email,
              "phone_number": phoneNumber,
              "created_at": createdAt,
              "token": token,
            },
            "profile": {
              "full_name": fullName,
              "birth_date": birthDate,
            },
          };
  }

  @override
  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map["id"] ?? -1,
      fullName: map["full_name"] ?? "",
      createdAt: map["created_at"] ?? "",
      username: map["username"] ?? "",
      phoneNumber: map["phone_number"] ?? "",
      birthDate: map["birth_date"] ?? "",
      email: map["email"] ?? "",
      token: map["token"] ?? "",
    );
  }

  @override
  String toJson() => json.encode(toMap());

  @override
  factory User.fromJson(String source) => User.fromMap(json.decode(source));
}
