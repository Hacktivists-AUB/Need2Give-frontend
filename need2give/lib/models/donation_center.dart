import 'dart:convert';
import 'package:need2give/models/account.dart';
import 'package:need2give/services/auth_service.dart';

class DonationCenterDTO extends Account {
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
    super.token = "",
    super.id = 0,
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
  final String createdAt;
  final double distance;
  final bool open;
  bool following;
  int followerCount;

  DonationCenter({
    required super.id,
    required super.token,
    required this.createdAt,
    required super.username,
    required super.phoneNumber,
    required super.email,
    required super.name,
    required super.latitude,
    required super.longitude,
    required super.openingTime,
    required super.closingTime,
    required super.description,
    required super.openingDays,
    this.distance = 0,
    this.open = false,
    this.following = false,
    this.followerCount = 0,
    super.password = "",
  });

  @override
  Map<String, dynamic> toMap({bool expanded = true}) {
    Map<String, dynamic> obj = {
      "account": {
        "id": id,
        "username": username,
        "email": email,
        "phone_number": phoneNumber,
        "created_at": createdAt,
        "token": token,
      },
      "profile": {
        "name": name,
        "latitude": latitude,
        "longitude": longitude,
        "description": description,
        "opening_time": openingTime,
        "closing_time": closingTime,
        "opening_days": openingDays,
      },
      "additional": {
        "distance": distance,
        "following": following,
        "open": open,
        "followerCount": followerCount,
      },
    };
    return expanded
        ? {...obj["account"], ...obj["profile"], ...obj["additional"]}
        : obj;
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
      distance: map["distance"] ?? -1.0,
      following: map["following"] ?? false,
      open: map["open"] ?? false,
      followerCount:
          map["follower_count"] == null ? 0 : int.parse(map["follower_count"]),
    );
  }

  @override
  String toJson() => json.encode(toMap());

  @override
  factory DonationCenter.fromJson(String source) =>
      DonationCenter.fromMap(json.decode(source));
}
