part of 'technical_cubit.dart';

@immutable
sealed class TechnicalState {}

final class TechnicalInitial extends TechnicalState {}
final class GetRangeDate extends TechnicalState {}

