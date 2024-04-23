import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


part 'staff_table_state.dart';

class StaffTableCubit extends Cubit<StaffTableState> {
  StaffTableCubit() : super(StaffTableInitial());
  static StaffTableCubit get(context) => BlocProvider.of(context);
  List<Widget> items = [];

  void add( item) {
    items.add(item);
    emit(StaffTableLoaded(items: items));
  }


}

