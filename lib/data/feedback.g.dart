// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feedback.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Review _$ReviewFromJson(Map<String, dynamic> json) => Review(
      json['waitingTimeRating'] as int,
      json['receptionRating'] as int,
      json['serviceQualityRating'] as int,
      json['priceRating'] as int,
      json['workCompletedFirstTime'] as bool,
      json['wouldRecommend'] as bool,
      DateTime.parse(json['time'] as String),
    )..id = json['id'] as String?;

Map<String, dynamic> _$ReviewToJson(Review instance) => <String, dynamic>{
      'id': instance.id,
      'waitingTimeRating': instance.waitingTimeRating,
      'receptionRating': instance.receptionRating,
      'serviceQualityRating': instance.serviceQualityRating,
      'priceRating': instance.priceRating,
      'workCompletedFirstTime': instance.workCompletedFirstTime,
      'wouldRecommend': instance.wouldRecommend,
      'time': instance.time.toIso8601String(),
    };
