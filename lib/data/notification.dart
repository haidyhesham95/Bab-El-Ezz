import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'notification.g.dart';

@JsonSerializable()
class Notification {
  String id;
  String message;
  DateTime timestamp;
  String type;

  Notification(this.id, this.message, this.timestamp, this.type);

  factory Notification.fromFirestore(DocumentSnapshot doc) =>
      Notification.fromJson(doc.data()! as Map<String, dynamic>)..id = doc.id;

  factory Notification.fromJson(Map<String, dynamic> json) =>
      _$NotificationFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationToJson(this);
}
