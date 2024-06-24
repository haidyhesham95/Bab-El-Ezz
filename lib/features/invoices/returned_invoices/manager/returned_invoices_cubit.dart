import 'package:bab_el_ezz/data/merchant.dart';
import 'package:bab_el_ezz/features/invoices/returned_invoices/widget/add_items_marchant_returned.dart';
import 'package:bab_el_ezz/firebase/firebase_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
  TextEditingController partNameController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController merchantNotesController = TextEditingController();
  TextEditingController merchantPriceController = TextEditingController();

  String selectedType = 'سليم';

  List<Merchant> merchants = [];
  List partWidgets = [];
  List<List<TextEditingController>> controllers = [];
  List<String> statuses = [];

  CollectionReference merchantsRef = FirebaseCollection().merchantsCol;
  int index = -1;

  addWidget({List<String> data = const ['', '', '', '', '']}) {
    controllers.add(
        List.generate(4, (index) => TextEditingController(text: data[index])));
    statuses.add(data[4].isNotEmpty ? data[4] : 'استبدال');
    index++;
    partWidgets.add(
        AddItemsMerchantReturned(controllers[index], this, statuses, index));
    emit(UpdateData());
  }

  Future getMerchants() async {
    final data = await merchantsRef.get();
    merchants = data.docs.map((e) => e.data() as Merchant).toList();
    emit(UpdateData());
  }

  void setSelectedType(String? value) {
    selectedType = value!;
    emit(TypeChanged(value));
  }

  Merchant? selectedMerchant;

  void setSelectedMerchantName(String? value) {
    selectedMerchant?.name = value ?? '';
    emit(MerchantNameChanged(value));
  }

  String? selectedCompanyName;

  String? selectedMerchantType;

  void setSelectedMerchantType(String? value) {
    selectedMerchantType = value;
    emit(TypeMerchantChanged(value));
  }

  void update() {
    emit(UpdateData());
  }
}
