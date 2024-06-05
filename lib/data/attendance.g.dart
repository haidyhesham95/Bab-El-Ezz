// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Attendance _$AttendanceFromJson(Map<String, dynamic> json) => Attendance(
      json['name'] as String?,
      json['technicianId'] as String?,
      json['status'] as String?,
      Attendance._dateTimeFromJson(json['arrivalTime'] as String?),
      Attendance._dateTimeFromJson(json['departureTime'] as String?),
      (json['bonus'] as num?)?.toDouble(),
      (json['deduction'] as num?)?.toDouble(),
      (json['advance'] as num?)?.toDouble(),
      json['notes'] as String?,
      json['date'] == null ? null : DateTime.parse(json['date'] as String),
    )..id = json['id'] as String?;

Map<String, dynamic> _$AttendanceToJson(Attendance instance) =>
    <String, dynamic>{
      'id': instance.id,
      'technicianId': instance.technicianId,
      'name': instance.name,
      'status': instance.status,
      'arrivalTime': Attendance._dateTimeToJson(instance.arrivalTime),
      'departureTime': Attendance._dateTimeToJson(instance.departureTime),
      'bonus': instance.bonus,
      'deduction': instance.deduction,
      'advance': instance.advance,
      'notes': instance.notes,
      'date': instance.date?.toIso8601String(),
    };
