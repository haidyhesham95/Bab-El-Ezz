import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'maintenance_invoice_state.dart';

class MaintenanceInvoiceCubit extends Cubit<MaintenanceInvoiceState> {
  MaintenanceInvoiceCubit() : super(MaintenanceInvoiceInitial());

  static MaintenanceInvoiceCubit get(context) => BlocProvider.of(context);
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  GlobalKey<FormState> formKey1 = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController invoiceNumberController = TextEditingController();
  TextEditingController cartNumberController = TextEditingController();
  TextEditingController modelController = TextEditingController();
  TextEditingController yearController = TextEditingController();
  TextEditingController screenNumberController = TextEditingController();
  TextEditingController matorNumberController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  TextEditingController cartModelController = TextEditingController();


  TextEditingController clientNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();




  List<DataRow> items = [];


  void addItem(DataRow item) {
    items.add(item);
    emit(AddItems(items.cast<Widget>()));
  }

}
