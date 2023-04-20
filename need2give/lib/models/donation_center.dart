import 'dart:convert';
import 'package:need2give/models/profile.dart';
import 'package:need2give/services/auth_service.dart';

class DonationCenterDTO extends Profile {
  final String name;
  final double latitude;
  final double longitude;
  final String openingTime;
  final String closingTime;
  final String description;
  final Map<String, dynamic> openingDays;

  DonationCenterDTO({
    required super.username,
    required super.email,
    super.phoneNumber,
    required super.password,
    required this.name,
    required this.latitude,
    required this.longitude,
    required this.openingTime,
    required this.closingTime,
    required this.description,
    required this.openingDays,
    super.type = AccountType.donationCenter,
  });

  @override
  Map<String, dynamic> toMap() {
    return {
      "account": super.toMap(),
      "profile": {
        "latitude": latitude,
        "longitude": longitude,
        "name": name,
        "description": description,
        "opening_time": openingTime,
        "closing_time": closingTime,
        "opening_days": openingDays,
      }
    };
  }

  factory DonationCenterDTO.fromMap(Map<String, dynamic> map) {
    return DonationCenterDTO(
      username: map["username"] ?? "",
      email: map["email"] ?? "",
      phoneNumber: map["phone_number"],
      password: map["password"] ?? "",
      name: map["full_name"] ?? "",
      latitude: map["latitude"] ?? 0.0,
      longitude: map["longitude"] ?? 0.0,
      description: map["description"] ?? "",
      openingTime: map["opening_time"] ?? "",
      closingTime: map["closing_time"] ?? "",
      openingDays: map["opening_days"] ?? {},
    );
  }

  @override
  String toJson() => json.encode(toMap());

  factory DonationCenterDTO.fromJson(String source) =>
      DonationCenterDTO.fromMap(json.decode(source));
}

class DonationCenter extends DonationCenterDTO {
  final int id;
  final String token;
  final String createdAt;

  DonationCenter({
    required this.id,
    required this.token,
    required this.createdAt,
    required String username,
    required String? phoneNumber,
    required String email,
    required String name,
    required double latitude,
    required double longitude,
    required String openingTime,
    required String closingTime,
    required String description,
    required Map<String, dynamic> openingDays,
  }) : super(
          username: username,
          email: email,
          phoneNumber: phoneNumber,
          password: "",
          name: name,
          longitude: longitude,
          latitude: latitude,
          description: description,
          openingTime: openingTime,
          closingTime: closingTime,
          openingDays: openingDays,
        );

  @override
  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "username": username,
      "email": email,
      "phone_number": phoneNumber,
      "created_at": createdAt,
      "name": name,
      "latitude": latitude,
      "longitude": longitude,
      "description": description,
      "opening_time": openingTime,
      "closing_time": closingTime,
      "opening_days": openingDays,
      "token": token,
    };
  }

  @override
  factory DonationCenter.fromMap(Map<String, dynamic> map) {
    return DonationCenter(
      id: map["id"] ?? -1,
      username: map["username"] ?? "",
      email: map["email"] ?? "",
      phoneNumber: map["phone_number"] ?? "",
      name: map["name"] ?? "",
      createdAt: map["created_at"] ?? "",
      latitude: map["latitude"] ?? 0.0,
      longitude: map["longitude"] ?? 0.0,
      description: map["description"] ?? "",
      openingTime: map["opening_time"] ?? "",
      closingTime: map["closing_time"] ?? "",
      openingDays: map["opening_days"] ?? {},
      token: map["token"] ?? "",
    );
  }

  @override
  String toJson() => json.encode(toMap());

  @override
  factory DonationCenter.fromJson(String source) =>
      DonationCenter.fromMap(json.decode(source));
}
