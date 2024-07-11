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
      finished: json['finished'] as bool? ?? false,
      startDate: json['startDate'] == null
          ? null
          : DateTime.parse(json['startDate'] as String),
      endDate: json['endDate'] == null
          ? null
          : DateTime.parse(json['endDate'] as String),
      technicians: (json['technicians'] as List<dynamic>?)
          ?.map((e) => Technician.fromJson(e as Map<String, dynamic>))
          .toList(),
      invoice: json['invoice'] == null
          ? null
          : SpareInvoice.fromJson(json['invoice'] as Map<String, dynamic>),
      notes: json['notes'] as String?,
      maintenanceType: json['maintenanceType'] as String?,
      paymentType: json['paymentType'] as String?,
      pastOrdersIds: (json['pastOrdersIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      carImage: json['carImage'] as String?,
    )..id = json['id'] as String?;

Map<String, dynamic> _$JobOrderToJson(JobOrder instance) => <String, dynamic>{
      'id': instance.id,
      'car': JobOrder.carToJson(instance.car),
      'clientName': instance.clientName,
      'phoneNumber': instance.phoneNumber,
      'maintenanceType': instance.maintenanceType,
      'technicians': JobOrder.techListToJson(instance.technicians),
      'notes': instance.notes,
      'pastOrdersIds': instance.pastOrdersIds,
      'finished': instance.finished,
      'startDate': instance.startDate?.toIso8601String(),
      'endDate': instance.endDate?.toIso8601String(),
      'invoice': JobOrder.invoiceToJson(instance.invoice),
      'paymentType': instance.paymentType,
      'carImage': instance.carImage,
    };
