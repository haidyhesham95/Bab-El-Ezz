part of 'financial_cubit.dart';

@immutable
sealed class FinancialState {}

final class FinancialInitial extends FinancialState {}

class GetRangeDate extends FinancialState {}