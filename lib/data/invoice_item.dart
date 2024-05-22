import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'invoice_item.g.dart';

@JsonSerializable()
class InvoiceItem {
  String id;
  String partId; // Reference to the Part document
  int quantity;
  double price;
  String notes;

  InvoiceItem(this.id, this.partId, this.quantity, this.price, this.notes);

  factory InvoiceItem.fromFirestore(DocumentSnapshot doc) =>
      InvoiceItem.fromJson(doc.data()! as Map<String, dynamic>)..id = doc.id;

  factory InvoiceItem.fromJson(Map<String, dynamic> json) =>
      _$InvoiceItemFromJson(json);

  Map<String, dynamic> toJson() => _$InvoiceItemToJson(this);
}
