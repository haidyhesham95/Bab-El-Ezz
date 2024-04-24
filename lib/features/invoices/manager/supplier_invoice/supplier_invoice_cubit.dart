import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'supplier_invoice_state.dart';

class SupplierInvoiceCubit extends Cubit<SupplierInvoiceState> {
  SupplierInvoiceCubit() : super(SupplierInvoiceInitial());

  static SupplierInvoiceCubit get(context) => BlocProvider.of(context);




  List<DataRow> invoicesItems = [];
  List<DataRow> suppliersItems = [];

  void addInvoiceItem(DataRow item) {
    invoicesItems.add(item);
    emit(AddInvoiceItems( invoicesItems.cast<Widget>()));
  }


  void addSupplierItem(DataRow item) {
    suppliersItems.add(item);
    emit(AddSupplierItems( suppliersItems.cast<Widget>()));
  }




}
