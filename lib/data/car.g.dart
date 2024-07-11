// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Car _$CarFromJson(Map<String, dynamic> json) => Car(
      make: json['make'] as String?,
      model: json['model'] as String?,
      licensePlate: json['licensePlate'] as String?,
      color: json['color'] as String?,
      year: json['year'] as String?,
      pastOrdersIds: (json['pastOrdersIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      mileage: json['mileage'] as String?,
      chassisNumber: json['chassisNumber'] as String?,
      engineNumber: json['engineNumber'] as String?,
      transmissionType: json['transmissionType'] as String?,
    )..id = json['id'] as String?;

Map<String, dynamic> _$CarToJson(Car instance) => <String, dynamic>{
      'id': instance.id,
      'make': instance.make,
      'model': instance.model,
      'licensePlate': instance.licensePlate,
      'color': instance.color,
      'year': instance.year,
      'mileage': instance.mileage,
      'chassisNumber': instance.chassisNumber,
      'engineNumber': instance.engineNumber,
      'transmissionType': instance.transmissionType,
      'pastOrdersIds': instance.pastOrdersIds,
    };
