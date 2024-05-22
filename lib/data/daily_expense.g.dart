// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_expense.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DailyExpense _$DailyExpenseFromJson(Map<String, dynamic> json) => DailyExpense(
      json['id'] as String,
      json['item'] as String,
      (json['amount'] as num).toDouble(),
      DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$DailyExpenseToJson(DailyExpense instance) =>
    <String, dynamic>{
      'id': instance.id,
      'item': instance.item,
      'amount': instance.amount,
      'date': instance.date.toIso8601String(),
    };
