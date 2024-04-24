import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'customer_invoice_state.dart';

class CustomerInvoiceCubit extends Cubit<CustomerInvoiceState> {
  CustomerInvoiceCubit() : super(CustomerInvoiceInitial());

  static CustomerInvoiceCubit get(context) => BlocProvider.of(context);

  List<DataRow> items = [];


  void addItem(DataRow item) {
    items.add(item);
    emit(AddItems(items.cast<Widget>()));
  }

}
