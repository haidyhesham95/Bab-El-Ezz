// The Inventory class is not explicitly mentioned in the requirements,
// but it's implied by the need to track parts and their quantities.
// Here's a possible implementation:

import 'package:bab_el_ezz/data/part.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'inventory.g.dart';

@JsonSerializable()
class Inventory {
  String id; // Could be the shop ID or a unique inventory ID
  List<Part> parts;

  Inventory(this.id, this.parts);

  factory Inventory.fromFirestore(DocumentSnapshot doc) =>
      Inventory.fromJson(doc.data()! as Map<String, dynamic>)..id = doc.id;

  factory Inventory.fromJson(Map<String, dynamic> json) =>
      _$InventoryFromJson(json);

  Map<String, dynamic> toJson() => _$InventoryToJson(this);
}
