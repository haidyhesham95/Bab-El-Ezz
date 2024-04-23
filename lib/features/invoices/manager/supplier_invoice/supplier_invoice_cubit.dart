import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'supplier_invoice_state.dart';

class SupplierInvoiceCubit extends Cubit<SupplierInvoiceState> {
  SupplierInvoiceCubit() : super(SupplierInvoiceInitial());

  static SupplierInvoiceCubit get(context) => BlocProvider.of(context);


  List<Widget> invoicesItems = [];
  List<Widget> suppliersItems = [];

  void addInvoiceItem( item) {
    invoicesItems.add(item);
    emit(AddInvoiceItems(items: invoicesItems));
  }

  void addSupplierItem( item) {
    suppliersItems.add(item);
    emit(AddSupplierItems(items: suppliersItems));
  }




}
