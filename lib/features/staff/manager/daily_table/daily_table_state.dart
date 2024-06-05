part of 'daily_table_cubit.dart';

@immutable
abstract class DailyTableState {}

final class DailyTableInitial extends DailyTableState {}

final class SelectedTypeChanged extends DailyTableState {
  final String? value;

  SelectedTypeChanged(this.value);
}

final class SelectedCheckOutTimeChanged extends DailyTableState {
  final TimeOfDay? value;

  SelectedCheckOutTimeChanged(this.value);
}

final class SelectedAttendanceChanged extends DailyTableState {
  final TimeOfDay? value;

  SelectedAttendanceChanged(this.value);
}

final class UpdateData extends DailyTableState {}
