import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'spare_invoices_state.dart';

class SpareInvoicesCubit extends Cubit<SpareInvoicesState> {
  SpareInvoicesCubit() : super(SpareInvoicesInitial());
  static SpareInvoicesCubit get(context) => BlocProvider.of(context);

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  GlobalKey<FormState> formKey1 = GlobalKey<FormState>();

  TextEditingController customerNameController = TextEditingController();
  TextEditingController customerPhoneController = TextEditingController();
  TextEditingController nameController = TextEditingController();
}
