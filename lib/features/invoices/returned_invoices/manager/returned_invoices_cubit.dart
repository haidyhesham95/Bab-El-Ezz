import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'returned_invoices_state.dart';

class ReturnedInvoicesCubit extends Cubit<ReturnedInvoicesState> {
  ReturnedInvoicesCubit() : super(ReturnedInvoicesInitial());

  static ReturnedInvoicesCubit get(context) => BlocProvider.of(context);
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  GlobalKey<FormState> formKey1 = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController countController = TextEditingController();
  TextEditingController notesController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController merchantTypeController = TextEditingController();
  TextEditingController merchantCountController = TextEditingController();
  TextEditingController merchantNotesController = TextEditingController();
  TextEditingController merchantPriceController = TextEditingController();

  String selectedType = 'سليم';

  void setSelectedType(String? value) {
    selectedType = value!;
    emit(TypeChanged(value));
  }

  String? selectedMerchantName;

  void setSelectedMerchantName(String? value) {
    selectedMerchantName = value;
    emit(MerchantNameChanged(value));
  }

  String? selectedCompanyName;

  void setSelectedCompanyName(String? value) {
    selectedCompanyName = value;
    emit(CompanyNameChanged(value));
  }

  String? selectedMerchantType;

  void setSelectedMerchantType(String? value) {
    selectedMerchantType = value;
    emit(TypeMerchantChanged(value));
  }
}
