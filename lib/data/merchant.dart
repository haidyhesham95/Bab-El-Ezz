import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'merchant.g.dart';

@JsonSerializable()
class Merchant {
  String? id;
  String name;
  String phone;
  String company;
  int? totalInvoices = 0;
  double? totalPrice = 0;
  double? totalPaid = 0;
  double? totalRemaining = 0;

  Merchant({required this.name, required this.phone, required this.company});

  factory Merchant.fromFirestore(DocumentSnapshot doc) =>
      Merchant.fromJson(doc.data()! as Map<String, dynamic>)..id = doc.id;

  factory Merchant.fromJson(Map<String, dynamic> json) =>
      _$MerchantFromJson(json);

  Map<String, dynamic> toJson() => _$MerchantToJson(this);
}
