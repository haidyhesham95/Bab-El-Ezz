// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spare_invoice.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpareInvoice _$SpareInvoiceFromJson(Map<String, dynamic> json) => SpareInvoice(
      (json['price'] as num).toDouble(),
      imagePath: json['imagePath'] as String,
      invoiceNumber: json['invoiceNumber'] as String,
      phoneNumber: json['phoneNumber'] as String,
      clientName: json['clientName'] as String,
      date: DateTime.parse(json['date'] as String),
      parts: (json['parts'] as List<dynamic>)
          .map((e) => Part.fromJson(e as Map<String, dynamic>))
          .toList(),
      discount: (json['discount'] as num?)?.toDouble() ?? 0,
      service: (json['service'] as num).toDouble(),
      notes: json['notes'] as String? ?? '',
    )..id = json['id'] as String?;

Map<String, dynamic> _$SpareInvoiceToJson(SpareInvoice instance) =>
    <String, dynamic>{
      'id': instance.id,
      'clientName': instance.clientName,
      'phoneNumber': instance.phoneNumber,
      'date': instance.date.toIso8601String(),
      'price': instance.price,
      'invoiceNumber': instance.invoiceNumber,
      'imagePath': instance.imagePath,
      'parts': instance.parts,
      'discount': instance.discount,
      'service': instance.service,
      'notes': instance.notes,
    };
