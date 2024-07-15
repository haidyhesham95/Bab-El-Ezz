import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'feedback.g.dart';

@JsonSerializable()
class Review {
  String? id;
  int waitingTimeRating;
  int receptionRating;
  int serviceQualityRating;
  int priceRating;
  bool workCompletedFirstTime;
  bool wouldRecommend;
  DateTime time;

  Review(
      this.waitingTimeRating,
      this.receptionRating,
      this.serviceQualityRating,
      this.priceRating,
      this.workCompletedFirstTime,
      this.wouldRecommend,
      this.time);

  factory Review.fromFirestore(DocumentSnapshot doc) =>
      Review.fromJson(doc.data()! as Map<String, dynamic>)..id = doc.id;

  factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewToJson(this);
}
