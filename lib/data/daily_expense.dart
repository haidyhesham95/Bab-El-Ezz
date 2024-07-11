import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'daily_expense.g.dart';

@JsonSerializable()
class DailyExpense {
  String? id;
  String item;
  double price;
  DateTime date;

  DailyExpense(this.item, this.price, this.date);

  factory DailyExpense.fromFirestore(DocumentSnapshot doc) =>
      DailyExpense.fromJson(doc.data()! as Map<String, dynamic>)..id = doc.id;

  factory DailyExpense.fromJson(Map<String, dynamic> json) =>
      _$DailyExpenseFromJson(json);

  Map<String, dynamic> toJson() => _$DailyExpenseToJson(this);
}
