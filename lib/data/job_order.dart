import 'package:bab_el_ezz/data/car.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'job_order.g.dart';

@JsonSerializable()
class JobOrder {
  String? id;
  @JsonKey(name: 'car', toJson: carToJson)
  Car? car;
  String? clientName;
  String? phoneNumber;
  String? description;
  List<String>? services;
  List<String>? partsUsed;
  String? status;
  DateTime? startDate;
  DateTime? endDate;
  String? technicianId;

  JobOrder(
      {this.car,
      this.clientName,
      this.phoneNumber,
      this.description,
      this.services,
      this.partsUsed,
      this.status,
      this.startDate,
      this.endDate,
      this.technicianId});

  JobOrder.empty() {
    car = Car.empty();
    phoneNumber = '';
    clientName = '';
    description = '';
    services = [];
    partsUsed = [];
    status = '';
    startDate = DateTime.now();
    endDate = DateTime.now();
    technicianId = '';
  }

  factory JobOrder.fromFirestore(DocumentSnapshot doc) =>
      JobOrder.fromJson(doc.data()! as Map<String, dynamic>)..id = doc.id;

  factory JobOrder.fromJson(Map<String, dynamic> json) =>
      _$JobOrderFromJson(json);

  Map<String, dynamic> toJson() => _$JobOrderToJson(this);

  static Map<String, dynamic>? carToJson(Car? car) => car?.toJson();
}
