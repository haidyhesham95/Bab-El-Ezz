// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'technician.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Technician _$TechnicianFromJson(Map<String, dynamic> json) => Technician(
      json['id'] as String?,
      json['name'] as String,
      json['phone'] as String?,
      json['nationalId'] as String,
      json['specialization'] as String,
      json['title'] as String,
      (json['dailyRate'] as num).toDouble(),
      lastPayment: json['lastPayment'] == null
          ? null
          : DateTime.parse(json['lastPayment'] as String),
      workDays: json['workDays'] as int?,
      offDays: json['offDays'] as int?,
      totalBonus: (json['totalBonus'] as num?)?.toDouble(),
      finalAmount: (json['finalAmount'] as num?)?.toDouble(),
      totalAdvance: (json['totalAdvance'] as num?)?.toDouble(),
      totalDeduction: (json['totalDeduction'] as num?)?.toDouble(),
      created: json['created'] == null
          ? null
          : DateTime.parse(json['created'] as String),
    );

Map<String, dynamic> _$TechnicianToJson(Technician instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phone': instance.phone,
      'nationalId': instance.nationalId,
      'specialization': instance.specialization,
      'title': instance.title,
      'dailyRate': instance.dailyRate,
      'created': instance.created?.toIso8601String(),
      'lastPayment': instance.lastPayment?.toIso8601String(),
      'workDays': instance.workDays,
      'offDays': instance.offDays,
      'totalBonus': instance.totalBonus,
      'totalAdvance': instance.totalAdvance,
      'totalDeduction': instance.totalDeduction,
      'finalAmount': instance.finalAmount,
    };
