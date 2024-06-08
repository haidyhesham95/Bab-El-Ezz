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
      lastPayment:
          Technician._dateTimeFromJson(json['lastPayment'] as Timestamp?),
      workDays: json['workDays'] as int?,
      offDays: json['offDays'] as int?,
      totalBonus: (json['totalBonus'] as num?)?.toDouble(),
      finalAmount: (json['finalAmount'] as num?)?.toDouble(),
      totalAdvance: (json['totalAdvance'] as num?)?.toDouble(),
      totalDeduction: (json['totalDeduction'] as num?)?.toDouble(),
      created: Technician._dateTimeFromJson(json['created'] as Timestamp?),
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
      'created': Technician._dateTimeToJson(instance.created),
      'lastPayment': Technician._dateTimeToJson(instance.lastPayment),
      'workDays': instance.workDays,
      'offDays': instance.offDays,
      'totalBonus': instance.totalBonus,
      'totalAdvance': instance.totalAdvance,
      'totalDeduction': instance.totalDeduction,
      'finalAmount': instance.finalAmount,
    };
