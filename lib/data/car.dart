import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'car.g.dart';

@JsonSerializable()
class Car {
  String? id;
  String? make;
  String? model;
  String? licensePlate;
  String? color;
  String? year;
  String? mileage;
  String? chassisNumber;
  String? engineNumber;
  String? transmissionType;
  List<String>? pastOrdersIds;

  Car(
      {this.make,
      this.model,
      this.licensePlate,
      this.color,
      this.year,
      this.pastOrdersIds,
      this.mileage,
      this.chassisNumber,
      this.engineNumber,
      this.transmissionType});

  Car.empty() {
    make = '';
    licensePlate = '';
    color = '';
    year = '';
    mileage = '';
    chassisNumber = '';
    engineNumber = '';
    transmissionType = '';
  }

  factory Car.fromFirestore(DocumentSnapshot doc) =>
      Car.fromJson(doc.data()! as Map<String, dynamic>)..id = doc.id;

  factory Car.fromJson(Map<String, dynamic> json) => _$CarFromJson(json);

  Map<String, dynamic> toJson() => _$CarToJson(this);
}
