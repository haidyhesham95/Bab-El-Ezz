// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Customer _$CustomerFromJson(Map<String, dynamic> json) => Customer(
      json['name'] as String,
      json['phoneNumber'] as String,
      json['carId'] as String?,
      created: json['created'] == null
          ? null
          : DateTime.parse(json['created'] as String),
    )..id = json['id'] as String?;

Map<String, dynamic> _$CustomerToJson(Customer instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phoneNumber': instance.phoneNumber,
      'created': instance.created?.toIso8601String(),
      'carId': instance.carId,
    };
