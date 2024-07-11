part of 'daily_expenses_cubit.dart';

@immutable
sealed class DailyExpensesState {}

final class DailyExpensesInitial extends DailyExpensesState {}

final class UpdateData extends DailyExpensesState {}
