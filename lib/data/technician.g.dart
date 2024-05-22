// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'technician.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Technician _$TechnicianFromJson(Map<String, dynamic> json) => Technician(
      json['id'] as String,
      json['name'] as String,
      json['employeeId'] as String,
      json['specialization'] as String,
      (json['dailyRate'] as num).toDouble(),
    );

Map<String, dynamic> _$TechnicianToJson(Technician instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'employeeId': instance.employeeId,
      'specialization': instance.specialization,
      'dailyRate': instance.dailyRate,
    };
