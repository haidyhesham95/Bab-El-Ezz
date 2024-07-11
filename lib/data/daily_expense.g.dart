// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_expense.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DailyExpense _$DailyExpenseFromJson(Map<String, dynamic> json) => DailyExpense(
      json['item'] as String,
      (json['price'] as num).toDouble(),
      DateTime.parse(json['date'] as String),
    )..id = json['id'] as String?;

Map<String, dynamic> _$DailyExpenseToJson(DailyExpense instance) =>
    <String, dynamic>{
      'id': instance.id,
      'item': instance.item,
      'price': instance.price,
      'date': instance.date.toIso8601String(),
    };
