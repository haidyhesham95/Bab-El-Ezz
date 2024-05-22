import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

import 'invoice_item.dart';

part 'invoice.g.dart';

@JsonSerializable()
class Invoice {
  String id;
  String invoiceNumber;
  DateTime date;
  String? customerId; // Optional for supplier invoices
  String? technicianId; // Optional for supplier invoices
  List<InvoiceItem> items;
  double discount;
  double total;
  String paymentMethod;
  String? invoiceImagePath;

  Invoice(
      this.id,
      this.invoiceNumber,
      this.date,
      this.customerId,
      this.technicianId,
      this.items,
      this.discount,
      this.total,
      this.paymentMethod,
      this.invoiceImagePath);

  factory Invoice.fromFirestore(DocumentSnapshot doc) =>
      Invoice.fromJson(doc.data()! as Map<String, dynamic>)..id = doc.id;

  factory Invoice.fromJson(Map<String, dynamic> json) =>
      _$InvoiceFromJson(json);

  Map<String, dynamic> toJson() => _$InvoiceToJson(this);
}
