part of 'car_number_cubit.dart';

@immutable
sealed class CarNumberState {
  final String licensePlate; // Added to store the license plate

  const CarNumberState({this.licensePlate = ''}); // Default to empty string

  CarNumberState copyWith({
    String? licensePlate,
  }) {
    return switch (this) {
      CarNumberInitial _ => CarNumberInitial(),
      LettersTapped _ =>
        LettersTapped(true, licensePlate: licensePlate ?? this.licensePlate),
      NumberTapped _ =>
        NumberTapped(true, licensePlate: licensePlate ?? this.licensePlate),
    };
  }
}

final class CarNumberInitial extends CarNumberState {}

final class LettersTapped extends CarNumberState {
  final bool isTapped;

  LettersTapped(this.isTapped,
      {super.licensePlate}); // Pass licensePlate to superclass
}

final class NumberTapped extends CarNumberState {
  final bool isTapped;

  NumberTapped(this.isTapped,
      {super.licensePlate}); // Pass licensePlate to superclass
}
