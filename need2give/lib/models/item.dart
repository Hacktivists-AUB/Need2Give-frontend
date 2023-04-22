import 'dart:convert';

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
    required this.donorID,
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

  factory ItemDTO.fromMap(Map<String, dynamic> map) {
    return ItemDTO(
      name: map["name"] ?? "",
      description: map["description"] ?? "",
      category: map["category"] ?? "",
      quantity: map["quantity"] ?? 0,
      donorID: map["donor_id"] ?? 0,
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

  const Item({
    required this.id,
    required super.name,
    required super.description,
    required super.category,
    required super.quantity,
    required super.donorID,
    required super.donationCenterID,
    required this.createdAt,
  });

  @override
  Map<String, dynamic> toMap() {
    return {
      "id": id,
      ...super.toMap(),
      "created_at": createdAt,
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
    );
  }

  @override
  String toJson() => json.encode(toMap());

  factory Item.fromJson(String source) => Item.fromMap(json.decode(source));
}
