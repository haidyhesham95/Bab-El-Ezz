import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'feedback.g.dart';

@JsonSerializable()
class Feedback {
  String id;
  int waitingTimeRating;
  int receptionRating;
  int serviceQualityRating;
  int priceRating;
  bool workCompletedFirstTime;
  bool wouldRecommend;

  Feedback(
      this.id,
      this.waitingTimeRating,
      this.receptionRating,
      this.serviceQualityRating,
      this.priceRating,
      this.workCompletedFirstTime,
      this.wouldRecommend);

  factory Feedback.fromFirestore(DocumentSnapshot doc) =>
      Feedback.fromJson(doc.data()! as Map<String, dynamic>)..id = doc.id;

  factory Feedback.fromJson(Map<String, dynamic> json) =>
      _$FeedbackFromJson(json);

  Map<String, dynamic> toJson() => _$FeedbackToJson(this);
}
