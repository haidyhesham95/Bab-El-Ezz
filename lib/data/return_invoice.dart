import 'package:bab_el_ezz/data/invoice.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'return_invoice.g.dart';

@JsonSerializable()
class ReturnInvoice extends Invoice {
  String part;
  int quantity;
  double price;
  String status;
  String notes;

  ReturnInvoice(
      {required this.part,
      required this.quantity,
      required this.price,
      required this.status,
      required this.notes})
      : super(
            invoiceNumber: '',
            imagePath: '',
            date: DateTime.now(),
            clientName: '',
            phoneNumber: '');

  factory ReturnInvoice.fromFirestore(DocumentSnapshot doc) =>
      ReturnInvoice.fromJson(doc.data()! as Map<String, dynamic>)
        ..invoiceNumber = doc.id;

  factory ReturnInvoice.fromJson(Map<String, dynamic> json) =>
      _$ReturnInvoiceFromJson(json);

  Map<String, dynamic> toJson() => _$ReturnInvoiceToJson(this);
}
