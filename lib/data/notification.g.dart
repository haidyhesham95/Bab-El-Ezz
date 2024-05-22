// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Notification _$NotificationFromJson(Map<String, dynamic> json) => Notification(
      json['id'] as String,
      json['message'] as String,
      DateTime.parse(json['timestamp'] as String),
      json['type'] as String,
    );

Map<String, dynamic> _$NotificationToJson(Notification instance) =>
    <String, dynamic>{
      'id': instance.id,
      'message': instance.message,
      'timestamp': instance.timestamp.toIso8601String(),
      'type': instance.type,
    };
