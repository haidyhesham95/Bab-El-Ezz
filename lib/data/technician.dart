import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'technician.g.dart';

@JsonSerializable()
class Technician {
  String? id;
  String name;
  String? phone;
  String nationalId;
  String specialization;
  String title;
  double dailyRate;
  DateTime? created;
  DateTime? lastPayment;
  int? workDays;
  int? offDays;
  double? totalBonus;
  double? totalAdvance;
  double? totalDeduction;
  double? finalAmount;

  Technician(
    this.id,
    this.name,
    this.phone,
    this.nationalId,
    this.specialization,
    this.title,
    this.dailyRate, {
    this.lastPayment,
    this.workDays,
    this.offDays,
    this.totalBonus,
    this.finalAmount,
    this.totalAdvance,
    this.totalDeduction,
    this.created,
  });

  factory Technician.fromFirestore(DocumentSnapshot doc) =>
      Technician.fromJson(doc.data()! as Map<String, dynamic>)..id = doc.id;

  factory Technician.fromJson(Map<String, dynamic> json) =>
      _$TechnicianFromJson(json);

  Map<String, dynamic> toJson() => _$TechnicianToJson(this);

  static DateTime? _dateTimeFromJson(Timestamp? timestamp) =>
      timestamp?.toDate();
  static Timestamp _dateTimeToJson(DateTime? dateTime) =>
      Timestamp.fromDate(dateTime!);
}
