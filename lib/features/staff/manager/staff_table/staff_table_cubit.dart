import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


part 'staff_table_state.dart';

class StaffTableCubit extends Cubit<StaffTableState> {
  StaffTableCubit() : super(StaffTableInitial());
  static StaffTableCubit get(context) => BlocProvider.of(context);



  List<DataRow> items = [];


  void addItem(DataRow item) {
    items.add(item);
    emit(StaffTableAdded(items.cast<Widget>()));
  }

}


