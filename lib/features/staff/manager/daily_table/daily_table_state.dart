part of 'daily_table_cubit.dart';

@immutable
sealed class DailyTableState {}

final class DailyTableInitial extends DailyTableState {}

final class SelectedTypeChanged extends DailyTableState {
  final String? value;

  SelectedTypeChanged(this.value);
}