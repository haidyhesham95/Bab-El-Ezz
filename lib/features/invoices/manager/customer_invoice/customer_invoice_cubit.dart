import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'customer_invoice_state.dart';

class CustomerInvoiceCubit extends Cubit<CustomerInvoiceState> {
  CustomerInvoiceCubit() : super(CustomerInvoiceInitial());

  static CustomerInvoiceCubit get(context) => BlocProvider.of(context);

  List<Widget> items = [];

  void add( item) {
    items.add(item);
    emit(AddItems(items: items));
  }

}
