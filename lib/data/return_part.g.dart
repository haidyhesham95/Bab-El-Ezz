// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'return_part.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReturnPart _$ReturnPartFromJson(Map<String, dynamic> json) => ReturnPart(
      price: (json['price'] as num).toDouble(),
      name: json['name'] as String,
      quantity: json['quantity'] as int,
      status: json['status'] as String,
      notes: json['notes'] as String,
    )
      ..id = json['id'] as String?
      ..clientName = json['clientName'] as String
      ..phoneNumber = json['phoneNumber'] as String
      ..date = DateTime.parse(json['date'] as String)
      ..invoiceNumber = json['invoiceNumber'] as String
      ..imagePath = json['imagePath'] as String;

Map<String, dynamic> _$ReturnPartToJson(ReturnPart instance) =>
    <String, dynamic>{
      'id': instance.id,
      'clientName': instance.clientName,
      'phoneNumber': instance.phoneNumber,
      'date': instance.date.toIso8601String(),
      'price': instance.price,
      'invoiceNumber': instance.invoiceNumber,
      'imagePath': instance.imagePath,
      'name': instance.name,
      'quantity': instance.quantity,
      'status': instance.status,
      'notes': instance.notes,
    };
