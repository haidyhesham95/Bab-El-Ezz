// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InvoiceItem _$InvoiceItemFromJson(Map<String, dynamic> json) => InvoiceItem(
      json['id'] as String,
      json['partId'] as String,
      json['quantity'] as int,
      (json['price'] as num).toDouble(),
      json['notes'] as String,
    );

Map<String, dynamic> _$InvoiceItemToJson(InvoiceItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'partId': instance.partId,
      'quantity': instance.quantity,
      'price': instance.price,
      'notes': instance.notes,
    };
