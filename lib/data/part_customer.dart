import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'part_customer.g.dart';

@JsonSerializable()
class PartCustomer {
  String? id;
  String name;
  String phoneNumber;
  DateTime? created;
  String? carId;

  PartCustomer(this.name, this.phoneNumber, this.carId, {this.created});

  factory PartCustomer.fromFirestore(DocumentSnapshot doc) =>
      PartCustomer.fromJson(doc.data()! as Map<String, dynamic>)..id = doc.id;

  factory PartCustomer.fromJson(Map<String, dynamic> json) =>
      _$PartCustomerFromJson(json);

  Map<String, dynamic> toJson() => _$PartCustomerToJson(this);
}
