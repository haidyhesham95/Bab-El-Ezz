import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'store_state.dart';

class StoreCubit extends Cubit<StoreState> {
  StoreCubit() : super(StoreInitial());
  static StoreCubit get(context) => BlocProvider.of(context);

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  List<DataRow> items = [];


  void addItem(DataRow item) {
    items.add(item);
    emit(StoreItemsAdded(items.cast<Widget>()));
  }
}
