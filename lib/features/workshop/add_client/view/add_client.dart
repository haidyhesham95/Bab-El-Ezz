import 'package:bab_el_ezz/car_number/view/car_number.dart';
import 'package:bab_el_ezz/car_number/view/letters_otp.dart';
import 'package:bab_el_ezz/features/workshop/add_client/widget/otp.dart';
import 'package:bab_el_ezz/shared_utils/utils/constant.dart';
import 'package:bab_el_ezz/shared_utils/utils/widget/button_widget.dart';
import 'package:bab_el_ezz/shared_utils/utils/widget/const_appbar.dart';
import 'package:bab_el_ezz/shared_utils/utils/widget/text_align.dart';
import 'package:bab_el_ezz/shared_utils/utils/widget/text_field.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared_utils/utils/widget/pay_container.dart';
import '../../../new_job-order/widgets/drop_button.dart';
import '../manager/add_client/add_client_cubit.dart';

class AddClient extends StatelessWidget {
  AddClient({super.key});

  final GlobalKey<OtpState> otpKey = GlobalKey();
  final GlobalKey<LettersOtpState> lettersOtpKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: constAppBar(context, ' اضافة عميل جديد'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: BlocProvider(
            create: (context) => AddClientCubit(),
            child: BlocConsumer<AddClientCubit, AddClientState>(
              listener: (context, state) {},
              builder: (context, state) {
                AddClientCubit cubit = AddClientCubit.get(context);
                return Form(
                  key: cubit.formKey,
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      TextFieldWidget(
                        label: " اسم العميل ",
                        hintText: " الاسم ",
                        controller: cubit.clientNameController,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.name,
                        errorMessage: 'الرجاء ادخال الاسم',
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFieldWidget(
                        label: " رقم الهاتف الخاص بالواتس اب ",
                        hintText: " 01xxxxxxxxx ",
                        controller: cubit.phoneNameController,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'الرجاء ادخال رقم الهاتف'; // Handle empty input
                          } else if (value.length != 11) {
                            return 'الرجاء إدخال رقم هاتف مكون من 11 رقم';
                          }
                          return null; // No error, validation successful
                        },
                        errorMessage: 'الرجاء ادخال رقم الهاتف',
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      DropButton(
                        hintText: 'نوع السيارة',
                        value: cubit.selectedCarType,
                        onChanged: (String? value) {
                          cubit.setSelectedCarType(value!);
                        },
                        items: carMakesAndModels.keys
                            .map((e) => DropdownMenuItem(
                                  value: e,
                                  child: Text(e),
                                ))
                            .toList(),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      DropButton(
                        hintText: 'موديل السيارة',
                        value: cubit.selectedCarModel,
                        onChanged: (String? value) {
                          cubit.setSelectedCarModel(value!);
                        },
                        items: carMakesAndModels[cubit.selectedCarType]
                            ?.map((e) => DropdownMenuItem(
                                  value: e,
                                  child: Text(e),
                                ))
                            .toList(),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      DropButton(
                        hintText: 'لون السيارة',
                        value: cubit.selectedCarColor,
                        onChanged: (String? value) {
                          cubit.setSelectedCarColor(value!);
                        },
                        items: const [
                          DropdownMenuItem(value: 'أبيض', child: Text('أبيض')),
                          DropdownMenuItem(value: 'أسود', child: Text('أسود')),
                          DropdownMenuItem(
                              value: 'رمادي', child: Text('رمادي')),
                          DropdownMenuItem(value: 'فضي', child: Text('فضي')),
                          DropdownMenuItem(value: 'أزرق', child: Text('أزرق')),
                          DropdownMenuItem(value: 'أحمر', child: Text('أحمر')),
                          DropdownMenuItem(value: 'أخضر', child: Text('أخضر')),
                          DropdownMenuItem(value: 'بني', child: Text('بني')),
                          DropdownMenuItem(value: 'ذهبي', child: Text('ذهبي')),
                          DropdownMenuItem(
                              value: 'فضي لامع', child: Text('فضي لامع')),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      DropButton(
                        hintText: 'سنة الصنع  ',
                        value: cubit.selectedYear,
                        onChanged: (String? value) {
                          cubit.setSelectedYear(value!);
                        },
                        items: const [
                          DropdownMenuItem(value: '2000', child: Text('2000')),
                          DropdownMenuItem(value: '2023', child: Text('2023')),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFieldWidget(
                        label: " عداد الكيلو ميترات ",
                        hintText: " العدد ",
                        controller: cubit.counterController,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        errorMessage: 'الرجاء ادخال العدد',
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFieldWidget(
                        label: " رقم الشاسية ",
                        hintText: " اداخل رقم الشاسية ",
                        controller: cubit.chassisNumberController,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        errorMessage: 'الرجاء ادخال رقم الشاسية',
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFieldWidget(
                        label: " رقم الموتور ",
                        hintText: " اداخل رقم الموتور ",
                        controller: cubit.motorNumberController,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        errorMessage: 'الرجاء ادخال رقم الموتور',
                      ),
                      const SizedBox(height: 15),
                      textAlign(context, ' نوع ناقل الحركة '),
                      const SizedBox(height: 15),
                      PayContainer(
                        title: " مانوال ",
                        onTap: () {
                          cubit.manualTapped();
                        },
                        isTapped: cubit.isTapped1,
                      ),
                      const SizedBox(height: 10),
                      PayContainer(
                        title: " اوتوماتيك ",
                        onTap: () {
                          cubit.automaticTapped();
                        },
                        isTapped: cubit.isTapped2,
                      ),
                      const SizedBox(height: 15),
                      textAlign(context, ' رقم لوحة السيارة '),
                      CarNumber(
                        otpKey: otpKey,
                        lettersOtpKey: lettersOtpKey,
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      ButtonWidget(
                        text: 'اضافة عميل',
                        hasElevation: true,
                        onPressed: () {
                          if (cubit.formKey.currentState!.validate() ||
                              kDebugMode) {
                            //TODO: add enter time as current time
                            var otpState = otpKey.currentState;
                            var lettersOtpState = lettersOtpKey.currentState;
                            String plateNumber;
                            if (otpState == null && lettersOtpState != null) {
                              //letters & numbers
                              plateNumber =
                                  lettersOtpState.otpController1.text +
                                      lettersOtpState.otpController2.text +
                                      lettersOtpState.otpController3.text +
                                      lettersOtpState.otpController4.text;
                              print("letters otp: $plateNumber");
                            } else if (otpState != null) {
                              //numbers
                              plateNumber = otpState.otpController1.text +
                                  otpState.otpController2.text +
                                  otpState.otpController3.text +
                                  otpState.otpController4.text;
                              print("otp: $plateNumber");
                            } else {
                              throw Exception(
                                  "OTP: $otpState, Letters: $lettersOtpState");
                            }
                            cubit.submitData(plateNumber).then((value) =>
                                Navigator.pushNamed(context, 'newJobOrderPage',
                                    arguments: value));
                          }
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
