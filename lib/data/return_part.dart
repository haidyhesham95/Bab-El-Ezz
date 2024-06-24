import 'package:bab_el_ezz/data/invoice.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'return_part.g.dart';

@JsonSerializable()
class ReturnPart extends Invoice {
  String name;
  int quantity;
  String status;
  String notes;

  ReturnPart(
      {required double price,
      required this.name,
      required this.quantity,
      required this.status,
      required this.notes})
      : super(
          clientName: '',
          price: price,
          phoneNumber: '',
          date: DateTime.now(),
          invoiceNumber: '',
          imagePath: '',
        );

  factory ReturnPart.fromFirestore(DocumentSnapshot doc) =>
      ReturnPart.fromJson(doc.data()! as Map<String, dynamic>)..id = doc.id;

  factory ReturnPart.fromJson(Map<String, dynamic> json) =>
      _$ReturnPartFromJson(json);

  Map<String, dynamic> toJson() => _$ReturnPartToJson(this);
}
