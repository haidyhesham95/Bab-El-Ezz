// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feedback.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Feedback _$FeedbackFromJson(Map<String, dynamic> json) => Feedback(
      json['id'] as String,
      json['waitingTimeRating'] as int,
      json['receptionRating'] as int,
      json['serviceQualityRating'] as int,
      json['priceRating'] as int,
      json['workCompletedFirstTime'] as bool,
      json['wouldRecommend'] as bool,
    );

Map<String, dynamic> _$FeedbackToJson(Feedback instance) => <String, dynamic>{
      'id': instance.id,
      'waitingTimeRating': instance.waitingTimeRating,
      'receptionRating': instance.receptionRating,
      'serviceQualityRating': instance.serviceQualityRating,
      'priceRating': instance.priceRating,
      'workCompletedFirstTime': instance.workCompletedFirstTime,
      'wouldRecommend': instance.wouldRecommend,
    };
