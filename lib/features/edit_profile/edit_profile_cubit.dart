import 'dart:io';

import 'package:bab_el_ezz/data/workshop.dart';
import 'package:bab_el_ezz/features/invoices/invoices/widget/add_image.dart';
import 'package:bab_el_ezz/firebase/firebase_collection.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';

part 'edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit() : super(EditProfileInitial());
  static EditProfileCubit get(context) => BlocProvider.of(context);

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController centerNameController = TextEditingController();
  TextEditingController ownerCenterNameController = TextEditingController();
  TextEditingController branchNameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController oldPasswordController = TextEditingController();

  final workshopRef = FirebaseCollection().workshopCol;
  Workshop? workshop;
  File? imageFile;

  getData() async {
    final data = await workshopRef.get();
    workshop = data.docs.where((e) => e.id == "profile").firstOrNull?.data();
    centerNameController.text = workshop?.name ?? '';
    ownerCenterNameController.text = workshop?.ownerName ?? '';
    branchNameController.text = workshop?.branch ?? '';
    addressController.text = workshop?.address ?? '';
    phoneController.text = workshop?.phoneNumber ?? '';
    emit(UpdateData());
  }

  Future updateInfo() async {
    EasyLoading.show();
    if (newPasswordController.text.isNotEmpty &&
        oldPasswordController.text.isNotEmpty) {
      await updatePassword();
    }
    final url = await uploadImage(imageFile, 'logo');
    Workshop workshop1 = Workshop(
      phoneController.text,
      newPasswordController.text,
      centerNameController.text,
      branchNameController.text,
      addressController.text,
      ownerCenterNameController.text,
      workshop?.secondaryPhoneNumber,
      workshop?.dataAnalysisPIN ?? '',
      workshop?.employeesPIN ?? '',
      workshop?.storePIN ?? '',
      url,
    );

    await workshopRef.doc('profile').update(workshop1.toJson());
    EasyLoading.dismiss();
  }

  Future<void> updatePassword() async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      try {
        await user.updatePassword(newPasswordController.text);
        // Password has been updated successfully
        print("Password updated successfully.");
      } on FirebaseAuthException catch (e) {
        // Handle error
        if (e.code == 'weak-password') {
          Fluttertoast.showToast(msg: 'The password provided is too weak.');
        } else if (e.code == 'requires-recent-login') {
          Fluttertoast.showToast(
              msg:
                  'The user must reauthenticate before this operation can be executed.');
        } else {
          Fluttertoast.showToast(msg: 'Error: ${e.message}');
        }
      }
    } else {
      Fluttertoast.showToast(msg: 'No user is signed in.');
    }
  }

  update() {
    emit(UpdateData());
  }
}
