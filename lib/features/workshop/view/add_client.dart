import 'package:bab_el_ezz/features/workshop/manager/add_client/add_client_cubit.dart';
import 'package:bab_el_ezz/features/workshop/widget/otp.dart';
import 'package:bab_el_ezz/shared_utils/styles/colors.dart';
import 'package:bab_el_ezz/shared_utils/styles/text.dart';
import 'package:bab_el_ezz/shared_utils/utils/widget/button_widget.dart';
import 'package:bab_el_ezz/shared_utils/utils/widget/const_appbar.dart';
import 'package:bab_el_ezz/shared_utils/utils/widget/text_align.dart';
import 'package:bab_el_ezz/shared_utils/utils/widget/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../shared_utils/utils/widget/pay_container.dart';
import '../../new_job-order/widgets/drop_button.dart';

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
                ),
                const SizedBox(height: 10,),
                 TextFieldWidget(
                  label: " رقم الهاتف الخاص بالواتس اب ",
                  hintText: " رقم الهاتف ",
                  controller: cubit.phoneNameController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                ),

                const SizedBox(height: 10,),

                DropButton(
                   styleHint:AppStyles.styleRegular14(context).copyWith(color: ColorsAsset.kDarkBrown,) ,
                  borderRadius: 10,
                  hintText: 'نوع السيارة',
                  //value: cubit.selectedValue,
                  onChanged: (String? value) {},
                   items: const [
                    DropdownMenuItem(
                        value: 'نوع السيارة', child: Text('نوع السيارة')),
                  ],
                ),

                const SizedBox(height: 10,),

                DropButton(

                  styleHint:AppStyles.styleRegular14(context).copyWith(color: ColorsAsset.kDarkBrown,) ,
                  borderRadius: 10,
                  hintText: 'موديل السيارة',
                  //value: cubit.selectedValue,
                  onChanged: (String? value) {},
                  items: const [
                    DropdownMenuItem(
                        value: 'موديل السيارة', child: Text('موديل السيارة')),
                  ],
                ),

                const SizedBox(height: 10,),

                DropButton(
                  styleHint:AppStyles.styleRegular14(context).copyWith(color: ColorsAsset.kDarkBrown,) ,
                  borderRadius: 10,
                  hintText: 'لون السيارة',
                  //value: cubit.selectedValue,
                  onChanged: (String? value) {},
                  items: const [
                    DropdownMenuItem(
                        value: 'لون السيارة', child: Text('لون السيارة')),
                  ],
                ),


                const SizedBox(height: 10,),

                DropButton(
                  styleHint:AppStyles.styleRegular14(context).copyWith(color: ColorsAsset.kDarkBrown,) ,
                  borderRadius: 10,
                  hintText: 'سنة الصنع : ',
                  //value: cubit.selectedValue,
                  onChanged: (String? value) {},
                  items: const [
                    DropdownMenuItem(
                        value: 'سنة الصنع :', child: Text('سنة الصنع :')),
                  ],
                ),

                const SizedBox(height: 10,),


                 TextFieldWidget(
                  label: " عداد الكيلو ميترات ",
                  hintText: " العداد ",
                  controller: cubit.counterController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 10,),

                 TextFieldWidget(
                  label: " رقم الشاسية ",
                  hintText: " رقم الشاسية ",
                  controller: cubit.screenNumberController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 10,),
                 TextFieldWidget(
                  label: " رقم الموتور ",
                  hintText: " رقم الموتور ",
                  controller: cubit.motorNumberController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
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
