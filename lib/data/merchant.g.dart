// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'merchant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Merchant _$MerchantFromJson(Map<String, dynamic> json) => Merchant(
      name: json['name'] as String,
      phone: json['phone'] as String,
      company: json['company'] as String,
    )
      ..id = json['id'] as String?
      ..totalInvoices = json['totalInvoices'] as int?
      ..totalPrice = (json['totalPrice'] as num?)?.toDouble()
      ..totalPaid = (json['totalPaid'] as num?)?.toDouble()
      ..totalRemaining = (json['totalRemaining'] as num?)?.toDouble();

Map<String, dynamic> _$MerchantToJson(Merchant instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phone': instance.phone,
      'company': instance.company,
      'totalInvoices': instance.totalInvoices,
      'totalPrice': instance.totalPrice,
      'totalPaid': instance.totalPaid,
      'totalRemaining': instance.totalRemaining,
    };
