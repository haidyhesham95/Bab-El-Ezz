import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'car_number_state.dart';

class CarNumberCubit extends Cubit<CarNumberState> {
  CarNumberCubit() : super(CarNumberInitial());

  static CarNumberCubit get(context) => BlocProvider.of(context);

  bool isTappedNumber = false;
  bool isTappedLitter = false;

  void numberTapped() {
    if (!isTappedNumber) {
      isTappedNumber = true;
      isTappedLitter = false;
      emit(NumberTapped(isTappedNumber));
    }
  }

  void littersTapped() {
    if (!isTappedLitter) {
      isTappedLitter = true;
      isTappedNumber = false;
      emit(LittersTapped(isTappedLitter));
    }
  }
}