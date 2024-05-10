import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'add_client_state.dart';

class AddClientCubit extends Cubit<AddClientState> {
  AddClientCubit() : super(AddClientInitial());

  static AddClientCubit get(context) => BlocProvider.of(context);

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController phoneNameController = TextEditingController();
  TextEditingController clientNameController = TextEditingController();
  TextEditingController counterController = TextEditingController();
  TextEditingController carTypeController = TextEditingController();
  TextEditingController carModelController = TextEditingController();
  TextEditingController carColorController = TextEditingController();
  TextEditingController screenNumberController = TextEditingController();
  TextEditingController motorNumberController = TextEditingController();

  bool isTapped1 = false;
  bool isTapped2 = false;
  bool isTapped3 = false;
  bool isTapped4 = false;

  void manualTapped() {
    isTapped1 = !isTapped1;
    isTapped2 = !isTapped1;
    emit(ManualTapped(isTapped1));
  }

  void automaticTapped() {
    isTapped2 = !isTapped2;
    isTapped1 = !isTapped2;
    emit(AutomaticTapped(isTapped2));
  }

  void numberTapped() {
    isTapped3 = !isTapped3;
    isTapped4 = !isTapped3;
    emit(NumberTapped(isTapped3));
  }

  void charactersTapped() {
    isTapped4 = !isTapped4;
    isTapped3 = !isTapped4;
    emit(CharactersTapped(isTapped4));
  }

  String? selectedCarType;

  void setSelectedCarType(String? value) {
    selectedCarType = value;
    emit(SelectCarTypeValueChanged(value));
  }

  String? selectedCarModel;

  void setSelectedCarModel(String? value) {
    selectedCarModel = value;
    emit(SelectCarModelValueChanged(value));
  }

  String? selectedCarColor;

  void setSelectedCarColor(String? value) {
    selectedCarColor = value;
    emit(SelectCarColorValueChanged(value));
  }

  String? selectedYear;

  void setSelectedYear(String? value) {
    selectedYear = value;
    emit(SelectYearValueChanged(value));
  }
}
