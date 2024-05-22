import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'workshop.g.dart';

@JsonSerializable()
class Workshop {
  String id;
  String phoneNumber;
  @JsonKey(includeToJson: false)
  String password;
  String name;
  String? branch;
  String address;
  String ownerName;
  String? secondaryPhoneNumber;
  @JsonKey(includeToJson: false)
  String dataAnalysisPIN;
  String? logoPath;

  Workshop(
      this.id,
      this.phoneNumber,
      this.password,
      this.name,
      this.branch,
      this.address,
      this.ownerName,
      this.secondaryPhoneNumber,
      this.dataAnalysisPIN,
      this.logoPath);

  factory Workshop.fromFirestore(DocumentSnapshot doc) =>
      Workshop.fromJson(doc.data()! as Map<String, dynamic>)..id = doc.id;

  factory Workshop.fromJson(Map<String, dynamic> json) =>
      _$WorkshopFromJson(json);

  Map<String, dynamic> toJson() => _$WorkshopToJson(this);
}
