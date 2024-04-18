part of 'staff_cubit.dart';

@immutable
sealed class StaffState {}

final class StaffInitial extends StaffState {}
final class ChangeSelectedIndex extends StaffState {
  final int index;

  ChangeSelectedIndex(this.index);
}


