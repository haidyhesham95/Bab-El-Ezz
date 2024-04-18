import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'staff_state.dart';

class StaffCubit extends Cubit<StaffState> {
  StaffCubit() : super(StaffInitial());


  static StaffCubit get(context) => BlocProvider.of(context);

  int selectedIndex = 0;

  void changeIndex(int index) {
    selectedIndex = index;
    emit(ChangeSelectedIndex(index));
  }


}
