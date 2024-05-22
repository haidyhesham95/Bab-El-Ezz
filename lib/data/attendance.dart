import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'attendance.g.dart';

@JsonSerializable()
class Attendance {
  String id;
  String technicianId; // Reference to the Technician document
  DateTime date;
  String status; // "Work" or "Leave"
  @JsonKey(fromJson: _dateTimeFromJson, toJson: _dateTimeToJson)
  DateTime? arrivalTime;
  @JsonKey(fromJson: _dateTimeFromJson, toJson: _dateTimeToJson)
  DateTime? departureTime;
  double bonus;
  double deduction;
  double advance;
  String notes;

  Attendance(
      this.id,
      this.technicianId,
      this.date,
      this.status,
      this.arrivalTime,
      this.departureTime,
      this.bonus,
      this.deduction,
      this.advance,
      this.notes);

  factory Attendance.fromFirestore(DocumentSnapshot doc) =>
      Attendance.fromJson(doc.data()! as Map<String, dynamic>)..id = doc.id;

  factory Attendance.fromJson(Map<String, dynamic> json) =>
      _$AttendanceFromJson(json);

  Map<String, dynamic> toJson() => _$AttendanceToJson(this);

  static DateTime? _dateTimeFromJson(Timestamp? timestamp) =>
      timestamp?.toDate();
  static Timestamp _dateTimeToJson(DateTime? dateTime) =>
      Timestamp.fromDate(dateTime!);
}
