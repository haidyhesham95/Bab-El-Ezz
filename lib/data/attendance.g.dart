// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Attendance _$AttendanceFromJson(Map<String, dynamic> json) => Attendance(
      json['id'] as String,
      json['technicianId'] as String,
      DateTime.parse(json['date'] as String),
      json['status'] as String,
      Attendance._dateTimeFromJson(json['arrivalTime'] as Timestamp?),
      Attendance._dateTimeFromJson(json['departureTime'] as Timestamp?),
      (json['bonus'] as num).toDouble(),
      (json['deduction'] as num).toDouble(),
      (json['advance'] as num).toDouble(),
      json['notes'] as String,
    );

Map<String, dynamic> _$AttendanceToJson(Attendance instance) =>
    <String, dynamic>{
      'id': instance.id,
      'technicianId': instance.technicianId,
      'date': instance.date.toIso8601String(),
      'status': instance.status,
      'arrivalTime': Attendance._dateTimeToJson(instance.arrivalTime),
      'departureTime': Attendance._dateTimeToJson(instance.departureTime),
      'bonus': instance.bonus,
      'deduction': instance.deduction,
      'advance': instance.advance,
      'notes': instance.notes,
    };
