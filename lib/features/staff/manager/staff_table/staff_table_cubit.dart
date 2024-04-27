import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


part 'staff_table_state.dart';

class StaffTableCubit extends Cubit<StaffTableState> {
  StaffTableCubit() : super(StaffTableInitial());
  static StaffTableCubit get(context) => BlocProvider.of(context);

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController degreeController = TextEditingController();
  TextEditingController majorController = TextEditingController();



}


