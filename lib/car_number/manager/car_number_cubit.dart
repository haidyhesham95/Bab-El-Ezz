import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'car_number_state.dart';

class CarNumberCubit extends Cubit<CarNumberState> {
  CarNumberCubit() : super(CarNumberInitial());

  static CarNumberCubit get(context) => BlocProvider.of(context);

  bool isTappedLetter = true;
  bool isTappedNumber = false;

  void lettersTapped() {
    isTappedLetter = true;
    isTappedNumber = false;
    emit(LettersTapped(true,
        licensePlate: state.licensePlate)); // Pass current licensePlate
  }

  void numberTapped() {
    isTappedLetter = false;
    isTappedNumber = true;
    emit(NumberTapped(true,
        licensePlate: state.licensePlate)); // Pass current licensePlate
  }

  void updateLicensePlate(String newPlate) {
    emit(state.copyWith(licensePlate: newPlate));
  }
}
