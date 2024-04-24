part of 'staff_table_cubit.dart';

@immutable
sealed class StaffTableState {}

final class StaffTableInitial extends StaffTableState {}


final class StaffTableAdded extends StaffTableState {
   late final List<Widget> items;

  StaffTableAdded(this.items);
}