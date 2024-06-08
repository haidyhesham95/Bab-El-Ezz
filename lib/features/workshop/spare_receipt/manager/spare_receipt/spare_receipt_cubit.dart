import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


part 'spare_receipt_state.dart';

class SpareReceiptCubit extends Cubit<SpareReceiptState> {
  SpareReceiptCubit() : super(SpareReceiptInitial());
  static SpareReceiptCubit get(context) => BlocProvider.of(context);
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController phoneController = TextEditingController();
  TextEditingController nameController = TextEditingController();




  List<DataRow> items = [];


  void addItem(DataRow item) {
    items.add(item);
    emit(AddItems(items.cast<Widget>()));
  }
}
