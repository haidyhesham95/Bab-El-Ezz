import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'technician.g.dart';

@JsonSerializable()
class Technician {
  String id;
  String name;
  String employeeId; // Assuming this is the unique ID for the technician
  String specialization;
  double dailyRate;

  Technician(
      this.id, this.name, this.employeeId, this.specialization, this.dailyRate);

  factory Technician.fromFirestore(DocumentSnapshot doc) =>
      Technician.fromJson(doc.data()! as Map<String, dynamic>)..id = doc.id;

  factory Technician.fromJson(Map<String, dynamic> json) =>
      _$TechnicianFromJson(json);

  Map<String, dynamic> toJson() => _$TechnicianToJson(this);
}
