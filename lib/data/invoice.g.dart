// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Invoice _$InvoiceFromJson(Map<String, dynamic> json) => Invoice(
      json['id'] as String,
      json['invoiceNumber'] as String,
      DateTime.parse(json['date'] as String),
      json['customerId'] as String?,
      json['technicianId'] as String?,
      (json['items'] as List<dynamic>)
          .map((e) => InvoiceItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['discount'] as num).toDouble(),
      (json['total'] as num).toDouble(),
      json['paymentMethod'] as String,
      json['invoiceImagePath'] as String?,
    );

Map<String, dynamic> _$InvoiceToJson(Invoice instance) => <String, dynamic>{
      'id': instance.id,
      'invoiceNumber': instance.invoiceNumber,
      'date': instance.date.toIso8601String(),
      'customerId': instance.customerId,
      'technicianId': instance.technicianId,
      'items': instance.items,
      'discount': instance.discount,
      'total': instance.total,
      'paymentMethod': instance.paymentMethod,
      'invoiceImagePath': instance.invoiceImagePath,
    };
