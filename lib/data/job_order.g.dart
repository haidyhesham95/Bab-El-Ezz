// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JobOrder _$JobOrderFromJson(Map<String, dynamic> json) => JobOrder(
      car: json['car'] == null
          ? null
          : Car.fromJson(json['car'] as Map<String, dynamic>),
      clientName: json['clientName'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      description: json['description'] as String?,
      services: (json['services'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      partsUsed: (json['partsUsed'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      status: json['status'] as String?,
      startDate: json['startDate'] == null
          ? null
          : DateTime.parse(json['startDate'] as String),
      endDate: json['endDate'] == null
          ? null
          : DateTime.parse(json['endDate'] as String),
      technicianId: json['technicianId'] as String?,
    )..id = json['id'] as String?;

Map<String, dynamic> _$JobOrderToJson(JobOrder instance) => <String, dynamic>{
      'id': instance.id,
      'car': JobOrder.carToJson(instance.car),
      'clientName': instance.clientName,
      'phoneNumber': instance.phoneNumber,
      'description': instance.description,
      'services': instance.services,
      'partsUsed': instance.partsUsed,
      'status': instance.status,
      'startDate': instance.startDate?.toIso8601String(),
      'endDate': instance.endDate?.toIso8601String(),
      'technicianId': instance.technicianId,
    };
