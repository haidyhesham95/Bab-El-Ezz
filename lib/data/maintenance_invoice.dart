import 'package:bab_el_ezz/data/invoice.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'maintenance_invoice.g.dart';

@JsonSerializable()
class MaintenanceInvoice extends Invoice {
  DateTime? date;
  String? clientName; // Optional for supplier invoices
  String? phoneNumber; // Optional for supplier invoices
  String? carBrand;
  String? carPlate;
  String? imagePath;

  MaintenanceInvoice({
    required String invoiceNumber,
    this.date,
    this.clientName,
    this.phoneNumber,
    this.carBrand,
    this.carPlate,
    this.imagePath,
  }) : super(invoiceNumber: invoiceNumber);

  factory MaintenanceInvoice.fromFirestore(DocumentSnapshot doc) =>
      MaintenanceInvoice.fromJson(doc.data()! as Map<String, dynamic>)
        ..invoiceNumber = doc.id;

  factory MaintenanceInvoice.fromJson(Map<String, dynamic> json) =>
      _$MaintenanceInvoiceFromJson(json);

  Map<String, dynamic> toJson() => _$MaintenanceInvoiceToJson(this);
}
