import 'package:bab_el_ezz/data/invoice.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'spare_invoice.g.dart';

@JsonSerializable()
class SpareInvoice extends Invoice {
  SpareInvoice({
    required String imagePath,
    required String invoiceNumber,
    required String clientName,
    required DateTime date,
  }) : super(
            invoiceNumber: invoiceNumber,
            imagePath: imagePath,
            date: date,
            clientName: clientName,
            phoneNumber: '');

  factory SpareInvoice.fromFirestore(DocumentSnapshot doc) =>
      SpareInvoice.fromJson(doc.data()! as Map<String, dynamic>)
        ..invoiceNumber = doc.id;

  factory SpareInvoice.fromJson(Map<String, dynamic> json) =>
      _$SpareInvoiceFromJson(json);

  Map<String, dynamic> toJson() => _$SpareInvoiceToJson(this);
}
