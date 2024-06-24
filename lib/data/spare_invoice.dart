import 'package:bab_el_ezz/data/invoice.dart';
import 'package:bab_el_ezz/data/part.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'spare_invoice.g.dart';

@JsonSerializable()
class SpareInvoice extends Invoice {
  List<Part> parts;
  double discount;
  double service;
  String notes;

  SpareInvoice(
    double price, {
    required String imagePath,
    required String invoiceNumber,
    required String phoneNumber,
    required String clientName,
    required DateTime date,
    required this.parts,
    this.discount = 0,
    required this.service,
    this.notes = '',
  }) : super(
            price: price,
            invoiceNumber: invoiceNumber,
            imagePath: imagePath,
            date: date,
            clientName: clientName,
            phoneNumber: phoneNumber);

  // Named constructor for an empty SpareInvoice
  SpareInvoice.empty()
      : parts = [],
        discount = 0.0,
        service = 0.0,
        notes = '',
        super(
          price: 0.0,
          invoiceNumber: '',
          imagePath: '',
          date: DateTime.now(),
          clientName: '',
          phoneNumber: '',
        );

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = _$SpareInvoiceToJson(this);
    data['parts'] = parts
        .map((part) => part.toJson())
        .toList(); // Convert parts to List<Map<String, dynamic>>
    return data;
  }

  factory SpareInvoice.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data()! as Map<String, dynamic>;
    data['parts'] = (data['parts'] as List<dynamic>)
        .map((partJson) => partJson)
        .toList(); // Convert parts back to List<Part>
    return _$SpareInvoiceFromJson(data);
  }
}
