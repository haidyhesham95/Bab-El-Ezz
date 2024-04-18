import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'new_job_state.dart';

class NewJobCubit extends Cubit<NewJobState> {
  NewJobCubit() : super(NewJobInitial());


  static NewJobCubit get(context) => BlocProvider.of(context);


  String? selectedValue;

  void setSelectedClientValue(String? value) {
    selectedValue = value;
    emit(AddClientValueChanged(value));
  }
  String? selectedMaintenanceType;

  void setSelectedMaintenanceType(String? value) {
    selectedMaintenanceType = value;
    emit(AddMaintenanceValueChanged(value));
  }



  bool isTapped1 = false;
  bool isTapped2 = false;


  void cashTapped() {
    isTapped1 = !isTapped1;
    emit( CashTapped(isTapped1));
  }

  void electronicTapped() {
    isTapped2 = !isTapped2;
    emit( ElectronicTapped(isTapped2));
  }
}