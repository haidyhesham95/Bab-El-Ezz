import 'package:bab_el_ezz/shared_utils/styles/colors.dart';
import 'package:bab_el_ezz/shared_utils/styles/text.dart';
import 'package:bab_el_ezz/shared_utils/utils/widget/button_widget.dart';
import 'package:bab_el_ezz/shared_utils/utils/widget/const_appbar.dart';
import 'package:bab_el_ezz/shared_utils/utils/widget/text_align.dart';
import 'package:bab_el_ezz/shared_utils/utils/widget/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../shared_utils/utils/widget/pay_container.dart';
import '../../../new_job-order/widgets/drop_button.dart';
import '../manager/add_client/add_client_cubit.dart';
import '../widget/otp.dart';

class AddClient extends StatelessWidget {
  const AddClient({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: constAppBar(context,' اضافة عميل جديد'),
      body: SingleChildScrollView
        (
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: BlocProvider(
            create: (context) => AddClientCubit(),
            child: BlocConsumer<AddClientCubit, AddClientState>(
              listener: (context, state) {},
              builder: (context, state) {
                AddClientCubit cubit = AddClientCubit.get(context);
           return Form(
           key:cubit.formKey,
              child: Column(
              children: [
                SizedBox(height: 20),
                 TextFieldWidget(
                  label: " اسم العميل ",
                  hintText: " الاسم ",
                  controller: cubit.clientNameController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.name,
                  errorMessage: 'الرجاء ادخال الاسم',
                ),
                const SizedBox(height: 10,),
                 TextFieldWidget(
                  label: " رقم الهاتف الخاص بالواتس اب ",
                  hintText: " +20 ",
                  controller: cubit.phoneNameController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  errorMessage: 'الرجاء ادخال رقم الهاتف',
                ),

                const SizedBox(height: 15,),

                DropButton(
                  hintText: 'نوع السيارة',
                  value: cubit.selectedCarType,
                  onChanged: (String? value) {
                    cubit.setSelectedCarType(value);
                  },
                   items: const [
                    DropdownMenuItem(
                        value: 'نوع السيارة', child: Text('نوع السيارة')),
                     DropdownMenuItem(
                         value: '1نوع السيارة', child: Text('1نوع السيارة')),

              ],
                ),

                const SizedBox(height: 15,),

                DropButton(

                  hintText: 'موديل السيارة',
                  value: cubit.selectedCarModel,
                  onChanged: (String? value) {
                    cubit.setSelectedCarModel(value);
                  },
                  items: const [
                    DropdownMenuItem(
                        value: 'موديل السيارة', child: Text('موديل السيارة')),
                    DropdownMenuItem(
                        value: 'موديل السيارة1', child: Text('1موديل السيارة')),
                  ],
                ),

                const SizedBox(height: 15,),

                DropButton(
                  hintText: 'لون السيارة',
                  value: cubit.selectedCarColor,
                  onChanged: (String? value) {
                    cubit.setSelectedCarColor(value);
                  },
                  items: const [
                    DropdownMenuItem(
                        value: 'لون السيارة', child: Text('لون السيارة')),
                    DropdownMenuItem(
                        value: 'احمر', child: Text('احمر')),
                  ],
                ),


                const SizedBox(height: 15,),

                DropButton(
                  hintText: 'سنة الصنع  ',
                    value:cubit.selectedYear ,
                  onChanged: (String? value) {
                    cubit.setSelectedYear(value);
                  },
                  items: const [
                    DropdownMenuItem( value: '2000 :', child: Text('2000')),
                    DropdownMenuItem( value: '2023 :', child: Text('2023')),

                  ],
                ),

                const SizedBox(height: 10,),


                 TextFieldWidget(
                  label: " عداد الكيلو ميترات ",
                  hintText: " العدد ",
                  controller: cubit.counterController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                   errorMessage: 'الرجاء ادخال العدد',
                ),
                const SizedBox(height: 10,),

                 TextFieldWidget(
                  label: " رقم الشاسية ",
                  hintText: " اداخل رقم الشاسية ",
                  controller: cubit.screenNumberController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                   errorMessage: 'الرجاء ادخال رقم الشاسية',
                ),
                const SizedBox(height: 10,),
                 TextFieldWidget(
                  label: " رقم الموتور ",
                  hintText: " اداخل رقم الموتور ",
                  controller: cubit.motorNumberController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                    errorMessage: 'الرجاء ادخال رقم الموتور',
                ),
                const SizedBox(height: 15),
                textAlign(context,' نوع ناقل الحركة '),
                const SizedBox(height: 15),
                 PayContainer(
                  title: " مانوال ",
                  onTap: (){
                    cubit.manualTapped();
                  },
                   isTapped: cubit.isTapped1,
                 ),
                const SizedBox(height: 10),
                PayContainer(
                  title: " اوتوماتيك ",
                  onTap: (){
                    cubit.automaticTapped();
                  },isTapped: cubit.isTapped2,
                ),
                const SizedBox(height: 15),
                textAlign(context,  ' رقم لوحة السيارة '),
                const SizedBox(height: 15),
                PayContainer(
                  title: " حروف و ارقام ",
                  onTap: (){
                    cubit.numberTapped();
                  },isTapped: cubit.isTapped3,
                ),
                const SizedBox(height: 10),
                PayContainer(
                  title: " ارقام فقط ",
                  onTap: (){

                    cubit.charactersTapped();

                  },
                  isTapped: cubit.isTapped4,
                ),
                const SizedBox(height: 20,),
                const Otp(),
                const SizedBox(height: 50,),
                 ButtonWidget(
                  text: 'اضافة عميل',
                  hasElevation: true,
                  onPressed: () {
                    if (cubit.formKey.currentState!.validate()) {
                    }
                  },

                ),
                const SizedBox(height: 20,),





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
