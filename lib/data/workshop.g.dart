// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workshop.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Workshop _$WorkshopFromJson(Map<String, dynamic> json) => Workshop(
      json['phoneNumber'] as String,
      json['password'] as String,
      json['name'] as String,
      json['branch'] as String?,
      json['address'] as String,
      json['ownerName'] as String,
      json['secondaryPhoneNumber'] as String?,
      json['dataAnalysisPIN'] as String,
      json['employeesPIN'] as String,
      json['storePIN'] as String,
      json['logoPath'] as String?,
    )..id = json['id'] as String?;

Map<String, dynamic> _$WorkshopToJson(Workshop instance) => <String, dynamic>{
      'id': instance.id,
      'phoneNumber': instance.phoneNumber,
      'password': instance.password,
      'name': instance.name,
      'branch': instance.branch,
      'address': instance.address,
      'ownerName': instance.ownerName,
      'secondaryPhoneNumber': instance.secondaryPhoneNumber,
      'dataAnalysisPIN': instance.dataAnalysisPIN,
      'employeesPIN': instance.employeesPIN,
      'storePIN': instance.storePIN,
      'logoPath': instance.logoPath,
    };
