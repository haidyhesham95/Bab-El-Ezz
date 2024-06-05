import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'attendance.g.dart';

@JsonSerializable()
class Attendance {
  String? id;
  String? technicianId; // Reference to the Technician document
  String? name;
  String? status; // "Work" or "Leave"
  @JsonKey(fromJson: _dateTimeFromJson, toJson: _dateTimeToJson)
  TimeOfDay? arrivalTime;
  @JsonKey(fromJson: _dateTimeFromJson, toJson: _dateTimeToJson)
  TimeOfDay? departureTime;
  double? bonus;
  double? deduction;
  double? advance;
  String? notes;
  DateTime? date;

  Attendance(
      this.name,
      this.technicianId,
      this.status,
      this.arrivalTime,
      this.departureTime,
      this.bonus,
      this.deduction,
      this.advance,
      this.notes,
      this.date);

  Attendance.empty(String id, String name) {
    this.name = name;
    technicianId = id;
    status = 'عمل';
    arrivalTime = TimeOfDay.now();
    departureTime = TimeOfDay.now();
    bonus = 0;
    deduction = 0;
    advance = 0;
    notes = '';
  }

  factory Attendance.fromFirestore(DocumentSnapshot doc) =>
      Attendance.fromJson(doc.data()! as Map<String, dynamic>)..id = doc.id;

  factory Attendance.fromJson(Map<String, dynamic> json) =>
      _$AttendanceFromJson(json);

  Map<String, dynamic> toJson() => _$AttendanceToJson(this);

  static TimeOfDay? _dateTimeFromJson(String? json) {
    if (json == null) return null;
    final parts = json.split(':');
    if (parts.length != 2) return null; // Invalid format
    return TimeOfDay(hour: int.parse(parts[0]), minute: int.parse(parts[1]));
  }

  static String? _dateTimeToJson(TimeOfDay? time) {
    if (time == null) return null;
    return '${time.hour}:${time.minute.toString().padLeft(2, '0')}'; // Format with leading zero for minutes
  }
}
