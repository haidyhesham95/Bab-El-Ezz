import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'customer.g.dart';

@JsonSerializable()
class Customer {
  String? id;
  String name;
  String phoneNumber;
  DateTime? created;
  String? carId;

  Customer(this.name, this.phoneNumber, this.carId, {this.created});

  factory Customer.fromFirestore(DocumentSnapshot doc) =>
      Customer.fromJson(doc.data()! as Map<String, dynamic>)..id = doc.id;

  factory Customer.fromJson(Map<String, dynamic> json) =>
      _$CustomerFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerToJson(this);
}
