import 'package:bab_el_ezz/data/invoice.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'maintenance_invoice.g.dart';

@JsonSerializable()
class MaintenanceInvoice extends Invoice {
  String? carBrand;
  String? carPlate;

  MaintenanceInvoice({
    required String invoiceNumber,
    required DateTime date,
    required String clientName,
    required String phoneNumber,
    this.carBrand,
    this.carPlate,
    required String imagePath,
  }) : super(
            price: 0.0,
            invoiceNumber: invoiceNumber,
            date: date,
            clientName: clientName,
            imagePath: imagePath,
            phoneNumber: phoneNumber);

  factory MaintenanceInvoice.fromFirestore(DocumentSnapshot doc) =>
      MaintenanceInvoice.fromJson(doc.data()! as Map<String, dynamic>)
        ..invoiceNumber = doc.id;

  factory MaintenanceInvoice.fromJson(Map<String, dynamic> json) =>
      _$MaintenanceInvoiceFromJson(json);

  Map<String, dynamic> toJson() => _$MaintenanceInvoiceToJson(this);
}
