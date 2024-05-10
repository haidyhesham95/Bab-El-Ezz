part of 'car_number_cubit.dart';

@immutable
sealed class CarNumberState {}

final class CarNumberInitial extends CarNumberState {}

final class LittersTapped extends CarNumberState {
  final bool isTapped ;

  LittersTapped(this.isTapped);
}

final class NumberTapped extends CarNumberState {
  final bool isTapped ;

  NumberTapped(this.isTapped);
}