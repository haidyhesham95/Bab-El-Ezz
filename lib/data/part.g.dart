// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'part.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Part _$PartFromJson(Map<String, dynamic> json) => Part(
      json['name'] as String,
      json['code'] as String?,
      json['quantity'] as int,
      json['brand'] as String,
      (json['sellingPrice'] as num).toDouble(),
      (json['wholesalePrice'] as num).toDouble(),
      json['lowStockThreshold'] as int,
    )..id = json['id'] as String?;

Map<String, dynamic> _$PartToJson(Part instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
      'quantity': instance.quantity,
      'brand': instance.brand,
      'sellingPrice': instance.sellingPrice,
      'wholesalePrice': instance.wholesalePrice,
      'lowStockThreshold': instance.lowStockThreshold,
    };
