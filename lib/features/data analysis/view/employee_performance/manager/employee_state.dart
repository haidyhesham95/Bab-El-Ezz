part of 'employee_cubit.dart';

@immutable
sealed class EmployeeState {}

final class EmployeeInitial extends EmployeeState {}

class GetRangeDate extends EmployeeState {}

class UpdateData extends EmployeeState {}
