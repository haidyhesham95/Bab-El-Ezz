import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'part.g.dart';

@JsonSerializable()
class Part {
  String? id;
  String name;
  String? code;
  int quantity;
  String? brand;
  double sellingPrice;
  double wholesalePrice;
  int lowStockThreshold;

  Part(
    this.name,
    this.code,
    this.quantity,
    this.brand,
    this.sellingPrice,
    this.wholesalePrice,
    this.lowStockThreshold,
  );

  factory Part.fromFirestore(DocumentSnapshot doc) =>
      Part.fromJson(doc.data()! as Map<String, dynamic>)..id = doc.id;

  factory Part.fromJson(Map<String, dynamic> json) => _$PartFromJson(json);

  Map<String, dynamic> toJson() => _$PartToJson(this);
}
