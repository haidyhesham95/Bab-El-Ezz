part of 'customer_cubit.dart';

@immutable
sealed class CustomerState {}

final class CustomerInitial extends CustomerState {}

class GetRangeDate extends CustomerState {}

class UpdateData extends CustomerState {}
