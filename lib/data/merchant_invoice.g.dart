// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'merchant_invoice.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MerchantInvoice _$MerchantInvoiceFromJson(Map<String, dynamic> json) =>
    MerchantInvoice(
      imagePath: json['imagePath'] as String,
      invoiceNumber: json['invoiceNumber'] as String,
      clientName: json['clientName'] as String,
      date: DateTime.parse(json['date'] as String),
      totalPrice: (json['totalPrice'] as num?)?.toDouble(),
      totalPaid: (json['totalPaid'] as num?)?.toDouble(),
      totalRemaining: (json['totalRemaining'] as num?)?.toDouble(),
      checkDate: json['checkDate'] == null
          ? null
          : DateTime.parse(json['checkDate'] as String),
    )
      ..id = json['id'] as String?
      ..phoneNumber = json['phoneNumber'] as String;

Map<String, dynamic> _$MerchantInvoiceToJson(MerchantInvoice instance) =>
    <String, dynamic>{
      'id': instance.id,
      'clientName': instance.clientName,
      'phoneNumber': instance.phoneNumber,
      'date': instance.date.toIso8601String(),
      'invoiceNumber': instance.invoiceNumber,
      'imagePath': instance.imagePath,
      'totalPrice': instance.totalPrice,
      'totalPaid': instance.totalPaid,
      'totalRemaining': instance.totalRemaining,
      'checkDate': instance.checkDate?.toIso8601String(),
    };
