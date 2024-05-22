// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workshop.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Workshop _$WorkshopFromJson(Map<String, dynamic> json) => Workshop(
      json['id'] as String,
      json['phoneNumber'] as String,
      json['password'] as String,
      json['name'] as String,
      json['branch'] as String?,
      json['address'] as String,
      json['ownerName'] as String,
      json['secondaryPhoneNumber'] as String?,
      json['dataAnalysisPIN'] as String,
      json['logoPath'] as String?,
    );

Map<String, dynamic> _$WorkshopToJson(Workshop instance) => <String, dynamic>{
      'id': instance.id,
      'phoneNumber': instance.phoneNumber,
      'name': instance.name,
      'branch': instance.branch,
      'address': instance.address,
      'ownerName': instance.ownerName,
      'secondaryPhoneNumber': instance.secondaryPhoneNumber,
      'logoPath': instance.logoPath,
    };
