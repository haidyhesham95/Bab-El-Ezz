import 'dart:ui';

import 'package:bab_el_ezz/shared_utils/utils/constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'car.g.dart';

@JsonSerializable()
class Car {
  String? id;
  String? make;
  String? model;
  String? licensePlate;
  String? color; // Use a private field to store the color string
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
      String? color, // Use the setter to initialize the color
      this.year,
      this.pastOrdersIds,
      this.mileage,
      this.chassisNumber,
      this.engineNumber,
      this.transmissionType}) {
    this.color = color;
  }

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

  // Custom getter for the color field
  Color? get colorAsColor => color != null ? colorFromString(color!) : null;

  factory Car.fromFirestore(DocumentSnapshot doc) =>
      Car.fromJson(doc.data()! as Map<String, dynamic>)..id = doc.id;

  factory Car.fromJson(Map<String, dynamic> json) => _$CarFromJson(json);

  Map<String, dynamic> toJson() => _$CarToJson(this)..['color'] = color;
}

// Utility function to convert color names to Color objects
Color? colorFromString(String colorName) {
  final hexColor = colorNameToHex[colorName.toLowerCase()];
  if (hexColor != null) {
    return Color(int.parse(hexColor));
  }
  return null; // Return null if the color name is not found
}
