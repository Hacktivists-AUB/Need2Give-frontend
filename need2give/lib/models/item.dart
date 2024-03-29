import 'dart:convert';

import 'package:need2give/models/donation_center.dart';

class ItemDTO {
  final String name;
  final String? description;
  final String category;
  final int quantity;
  final int? donorID;
  final int donationCenterID;

  const ItemDTO({
    required this.name,
    required this.description,
    required this.category,
    required this.quantity,
    this.donorID,
    required this.donationCenterID,
  });

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "description": description,
      "category": category,
      "quantity": quantity,
      "donor_id": donorID,
      "donation_center_id": donationCenterID,
    };
  }

  ItemDTO copyWithoutDonorId() {
    return ItemDTO(
      name: name,
      description: description,
      category: category,
      donationCenterID: donationCenterID,
      quantity: quantity,
    );
  }

  factory ItemDTO.fromMap(Map<String, dynamic> map) {
    return ItemDTO(
      name: map["name"] ?? "",
      description: map["description"] ?? "",
      category: map["category"] ?? "",
      quantity: map["quantity"] ?? 0,
      donorID: map["donor_id"],
      donationCenterID: map["donation_center_id"] ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory ItemDTO.fromJson(String source) =>
      ItemDTO.fromMap(json.decode(source));
}

class Item extends ItemDTO {
  final int id;
  final String createdAt;
  final DonationCenter donationCenter;

  const Item({
    required this.id,
    required super.name,
    required super.description,
    required super.category,
    required super.quantity,
    required super.donorID,
    required super.donationCenterID,
    required this.createdAt,
    required this.donationCenter,
  });

  @override
  Map<String, dynamic> toMap() {
    return {
      "id": id,
      ...super.toMap(),
      "created_at": createdAt,
      "donation_center": donationCenter.toMap(),
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map["id"] ?? 0,
      name: map["name"] ?? "",
      description: map["description"] ?? "",
      category: map["category"] ?? "",
      quantity: map["quantity"] ?? 0,
      donorID: map["donor_id"] ?? 0,
      donationCenterID: map["donation_center_id"] ?? 0,
      createdAt: map["created_at"] ?? "",
      donationCenter: DonationCenter.fromMap(map["donation_center"]),
    );
  }

  @override
  String toJson() => json.encode(toMap());

  factory Item.fromJson(String source) => Item.fromMap(json.decode(source));
}
