part of 'staff_table_cubit.dart';

@immutable
sealed class StaffTableState {}

final class StaffTableInitial extends StaffTableState {}


final class StaffTableLoaded extends StaffTableState {
  final List<Widget> items;

  StaffTableLoaded({required this.items});
}