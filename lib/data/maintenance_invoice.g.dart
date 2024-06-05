// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'maintenance_invoice.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MaintenanceInvoice _$MaintenanceInvoiceFromJson(Map<String, dynamic> json) =>
    MaintenanceInvoice(
      invoiceNumber: json['invoiceNumber'] as String,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      clientName: json['clientName'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      carBrand: json['carBrand'] as String?,
      carPlate: json['carPlate'] as String?,
      imagePath: json['imagePath'] as String?,
    )..id = json['id'] as String?;

Map<String, dynamic> _$MaintenanceInvoiceToJson(MaintenanceInvoice instance) =>
    <String, dynamic>{
      'id': instance.id,
      'invoiceNumber': instance.invoiceNumber,
      'date': instance.date?.toIso8601String(),
      'clientName': instance.clientName,
      'phoneNumber': instance.phoneNumber,
      'carBrand': instance.carBrand,
      'carPlate': instance.carPlate,
      'imagePath': instance.imagePath,
    };
