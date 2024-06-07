// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'return_invoice.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReturnInvoice _$ReturnInvoiceFromJson(Map<String, dynamic> json) =>
    ReturnInvoice(
      part: json['part'] as String,
      quantity: json['quantity'] as int,
      price: (json['price'] as num).toDouble(),
      status: json['status'] as String,
      notes: json['notes'] as String,
    )
      ..id = json['id'] as String?
      ..clientName = json['clientName'] as String
      ..phoneNumber = json['phoneNumber'] as String
      ..date = DateTime.parse(json['date'] as String)
      ..invoiceNumber = json['invoiceNumber'] as String
      ..imagePath = json['imagePath'] as String;

Map<String, dynamic> _$ReturnInvoiceToJson(ReturnInvoice instance) =>
    <String, dynamic>{
      'id': instance.id,
      'clientName': instance.clientName,
      'phoneNumber': instance.phoneNumber,
      'date': instance.date.toIso8601String(),
      'invoiceNumber': instance.invoiceNumber,
      'imagePath': instance.imagePath,
      'part': instance.part,
      'quantity': instance.quantity,
      'price': instance.price,
      'status': instance.status,
      'notes': instance.notes,
    };
