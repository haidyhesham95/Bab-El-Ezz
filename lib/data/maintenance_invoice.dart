import 'package:bab_el_ezz/data/invoice.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

import 'job_order.dart';

part 'maintenance_invoice.g.dart';

@JsonSerializable()
class MaintenanceInvoice extends Invoice {
  String carBrand;
  String carPlate;
  String carColor;

  MaintenanceInvoice({
    required String invoiceNumber,
    required DateTime date,
    required String clientName,
    required String phoneNumber,
    required String imagePath,
    required double price,
    required this.carBrand,
    required this.carPlate,
    required this.carColor,
  }) : super(
            price: price,
            invoiceNumber: invoiceNumber,
            date: date,
            clientName: clientName,
            imagePath: imagePath,
            phoneNumber: phoneNumber);

  factory MaintenanceInvoice.fromFirestore(DocumentSnapshot doc) =>
      MaintenanceInvoice.fromJson(doc.data()! as Map<String, dynamic>)
        ..id = doc.id;

  factory MaintenanceInvoice.fromJson(Map<String, dynamic> json) =>
      _$MaintenanceInvoiceFromJson(json);

  Map<String, dynamic> toJson() => _$MaintenanceInvoiceToJson(this);

  factory MaintenanceInvoice.fromJobOrder(JobOrder jobOrder) {
    // Error handling: Ensure required data is present
    // if (jobOrder.car == null || jobOrder.invoice == null) {
    //   throw ArgumentError('JobOrder is missing car or invoice data.');
    // }

    return MaintenanceInvoice(
      invoiceNumber: jobOrder.invoice!.invoiceNumber,
      date: jobOrder.invoice!.date,
      clientName: jobOrder.clientName!,
      phoneNumber: jobOrder.phoneNumber!,
      imagePath: jobOrder.invoice!.imagePath,
      price: jobOrder.invoice!.price,
      carBrand: jobOrder.car?.make ?? '',
      carPlate: jobOrder.car?.licensePlate ?? '',
      carColor: jobOrder.car?.color ?? '',
    );
  }
}
