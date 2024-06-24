// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'maintenance_invoice.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MaintenanceInvoice _$MaintenanceInvoiceFromJson(Map<String, dynamic> json) =>
    MaintenanceInvoice(
      invoiceNumber: json['invoiceNumber'] as String,
      date: DateTime.parse(json['date'] as String),
      clientName: json['clientName'] as String,
      phoneNumber: json['phoneNumber'] as String,
      carBrand: json['carBrand'] as String?,
      carPlate: json['carPlate'] as String?,
      imagePath: json['imagePath'] as String,
    )
      ..id = json['id'] as String?
      ..price = (json['price'] as num).toDouble();

Map<String, dynamic> _$MaintenanceInvoiceToJson(MaintenanceInvoice instance) =>
    <String, dynamic>{
      'id': instance.id,
      'clientName': instance.clientName,
      'phoneNumber': instance.phoneNumber,
      'date': instance.date.toIso8601String(),
      'price': instance.price,
      'invoiceNumber': instance.invoiceNumber,
      'imagePath': instance.imagePath,
      'carBrand': instance.carBrand,
      'carPlate': instance.carPlate,
    };
