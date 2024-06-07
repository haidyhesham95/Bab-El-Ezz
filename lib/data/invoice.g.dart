// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Invoice _$InvoiceFromJson(Map<String, dynamic> json) => Invoice(
      clientName: json['clientName'] as String,
      phoneNumber: json['phoneNumber'] as String,
      date: DateTime.parse(json['date'] as String),
      invoiceNumber: json['invoiceNumber'] as String,
      imagePath: json['imagePath'] as String,
    )..id = json['id'] as String?;

Map<String, dynamic> _$InvoiceToJson(Invoice instance) => <String, dynamic>{
      'id': instance.id,
      'clientName': instance.clientName,
      'phoneNumber': instance.phoneNumber,
      'date': instance.date.toIso8601String(),
      'invoiceNumber': instance.invoiceNumber,
      'imagePath': instance.imagePath,
    };
