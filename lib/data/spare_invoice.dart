import 'package:bab_el_ezz/data/invoice.dart';
import 'package:bab_el_ezz/data/part.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'spare_invoice.g.dart';

@JsonSerializable()
class SpareInvoice extends Invoice {
  final Part part;
  final double discount;
  final double service;
  final String notes;

  SpareInvoice({
    required String imagePath,
    required String invoiceNumber,
    required String phoneNumber,
    required String clientName,
    required DateTime date,
    required this.part,
    this.discount = 0,
    required this.service,
    this.notes = '',
  }) : super(
            invoiceNumber: invoiceNumber,
            imagePath: imagePath,
            date: date,
            clientName: clientName,
            phoneNumber: phoneNumber);

  factory SpareInvoice.fromFirestore(DocumentSnapshot doc) =>
      SpareInvoice.fromJson(doc.data()! as Map<String, dynamic>)
        ..invoiceNumber = doc.id;

  factory SpareInvoice.fromJson(Map<String, dynamic> json) =>
      _$SpareInvoiceFromJson(json);

  Map<String, dynamic> toJson() => _$SpareInvoiceToJson(this);
}
