import 'package:bab_el_ezz/data/part.dart';
import 'package:bab_el_ezz/firebase/firebase_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'store_state.dart';

class StoreCubit extends Cubit<StoreState> {
  StoreCubit() : super(StoreInitial());
  static StoreCubit get(context) => BlocProvider.of(context);

  CollectionReference partRef = FirebaseCollection().partCol;
  List<Part> parts = [];

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController codeController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController brandController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController salePriceController = TextEditingController();
  TextEditingController alertController = TextEditingController();

  Future addPart() async {
    Part part = Part(
        nameController.text,
        codeController.text,
        int.parse(quantityController.text),
        brandController.text,
        double.parse(priceController.text),
        double.parse(salePriceController.text),
        int.parse(alertController.text));
    parts.add(part);
    await partRef.add(part);
    emit(StoreItemsAdded(const []));
    //todo: handle added part in the view
    return part;
  }

  updateParts(Part value) {
    parts.add(value);
    emit(StoreItemsAdded(const []));
  }

  getParts() async {
    final doc = await partRef.get();
    parts.clear();
    parts = doc.docs.map((e) => (e.data() as Part)).toList();
    emit(StoreItemsAdded(const []));
  }
}
