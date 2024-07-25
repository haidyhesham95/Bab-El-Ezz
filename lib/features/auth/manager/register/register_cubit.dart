import 'package:bab_el_ezz/data/workshop.dart';
import 'package:bab_el_ezz/firebase/firebase_collection.dart';
import 'package:bab_el_ezz/shared_utils/utils/constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  static RegisterCubit get(context) => BlocProvider.of(context);

  GlobalKey<FormState> formKey1 = GlobalKey<FormState>();
  GlobalKey<FormState> formKey2 = GlobalKey<FormState>();
  TextEditingController phoneNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController workshopNameController = TextEditingController();
  TextEditingController branchNameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController ownerNameController = TextEditingController();
  TextEditingController dataPasswordController = TextEditingController();
  TextEditingController employeePasswordController = TextEditingController();
  TextEditingController storePasswordController = TextEditingController();

  void update() {
    emit(UpdateData());
  }

  Future register(Workshop workshop, String password) async {
    String email = "${workshop.phoneNumber}$EMAIL_POSTFIX";
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    CollectionReference workshopRef = FirebaseCollection().workshopCol;
    await workshopRef.doc("profile").set(workshop);
  }
}
