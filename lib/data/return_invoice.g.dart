// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'return_invoice.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReturnInvoice _$ReturnInvoiceFromJson(Map<String, dynamic> json) =>
    ReturnInvoice(
      price: (json['price'] as num).toDouble(),
      phoneNumber: json['phoneNumber'] as String,
      clientName: json['clientName'] as String,
      company: json['company'] as String,
      parts: (json['parts'] as List<dynamic>)
          .map((e) => ReturnPart.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..id = json['id'] as String?
      ..date = DateTime.parse(json['date'] as String)
      ..invoiceNumber = json['invoiceNumber'] as String
      ..imagePath = json['imagePath'] as String;

Map<String, dynamic> _$ReturnInvoiceToJson(ReturnInvoice instance) =>
    <String, dynamic>{
      'id': instance.id,
      'clientName': instance.clientName,
      'phoneNumber': instance.phoneNumber,
      'date': instance.date.toIso8601String(),
      'price': instance.price,
      'invoiceNumber': instance.invoiceNumber,
      'imagePath': instance.imagePath,
      'company': instance.company,
      'parts': instance.parts,
    };
