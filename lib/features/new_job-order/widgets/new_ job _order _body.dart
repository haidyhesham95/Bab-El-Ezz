import 'package:bab_el_ezz/features/new_job-order/manager/new_job/new_job_cubit.dart';
import 'package:bab_el_ezz/features/new_job-order/widgets/table_item.dart';
import 'package:bab_el_ezz/shared_utils/utils/widget/pay_container.dart';
import 'package:bab_el_ezz/shared_utils/styles/text.dart';
import 'package:bab_el_ezz/shared_utils/utils/widget/text_align.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../generated/assets.dart';
import '../../../shared_utils/utils/widget/button_widget.dart';
import '../../../shared_utils/utils/widget/text_field.dart';
import '../../workshop/work_shop/widget/add_button.dart';
import 'add_note_text.dart';
import 'add_receipt_table.dart';
import 'car_data.dart';
import 'details.dart';
import 'drop_button.dart';

class NewJobOrderBody extends StatelessWidget {
  const NewJobOrderBody({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: BlocProvider(
          create: (context) => NewJobCubit(),
          child: BlocBuilder<NewJobCubit, NewJobState>(
            builder: (context, state) {
              NewJobCubit cubit = NewJobCubit.get(context);
              return SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    const Details(),
                    const SizedBox(height: 20),
                    const CarData(),
                    const SizedBox(height: 20),
                    TextFieldWidget(
                      label: "عدد الكيلومترات",
                      titleStyle: AppStyles.styleMedium16(context),
                      hintStyle: AppStyles.styleSemiBold14(context),
                      hintText: ' ادخال العدد',
                      onChanged: (value) {},
                      controller: cubit.kMController,
                      errorMessage: 'الرجاء ادخال العدد',
                    ),



                    const SizedBox(height: 20),
                      DropButton(
                        styleHint:AppStyles.styleSemiBold14(context),
                        hintText: 'نوع الصيانة',
                      value: cubit.selectedMaintenanceType,
                      onChanged: (String? value) {
                        cubit.setSelectedMaintenanceType(value);
                      },
                      items: const [
                        DropdownMenuItem(
                          value: 'صيانه اعطال',
                          child: Text('صيانه اعطال'),
                        ),
                        DropdownMenuItem(
                          value: 'صيانة دورية',
                          child: Text('صيانة دورية'),
                        ),
                        DropdownMenuItem(
                          value: 'مرتجع',
                          child: Text('مرتجع تكرار أعطال'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: DropButton(
                            styleHint:AppStyles.styleSemiBold14(context),
                            hintText: 'اضافة فني للسيارة',
                            value: cubit.selectedValue,
                            onChanged: (String? value) {
                              cubit.setSelectedClientValue(value);
                            },
                            items: const [
                              DropdownMenuItem(
                                  value: 'اضافة فني', child: Text('اضافة فني')),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10),
                        AddButton(
                          onPressed: () {},
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    Image.asset(
                      Assets.imagesCars,
                    ),
                    const SizedBox(height: 20),
                    addNoteText(context),
                    const SizedBox(height: 10),
                    textAlign(
                      context,
                      'اضافة تفاصيل الفاتورة  ',
                    ),
                    const SizedBox(height: 15),
                     AddReceiptTable(
                      rows: cubit.items,
                      onPressed: () {
                        cubit.addItem(tableItem(context));
                      },

                    ),
                    const SizedBox(height: 20),
                    textAlign(context, 'تحديد طريقة الدفع'),
                    const SizedBox(height: 15),
                    PayContainer(
                      title: "دفع كاش",
                      onTap: cubit.cashTapped,
                      isTapped: cubit.isTapped1,
                    ),
                    const SizedBox(height: 10),
                    PayContainer(
                      title: "دفع الكتروني ",
                      onTap: cubit.electronicTapped,
                      isTapped: cubit.isTapped2,
                    ),
                    const SizedBox(height: 50),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ButtonWidget(
                          hasElevation: true,
                          text: "حفظ مؤقت",
                          onPressed: () {},
                          width: size.width * 0.4,
                          height: size.height * 0.05,
                        ),
                        ButtonWidget(
                          hasElevation: true,
                          text: "انهاء امر الشغل",
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          width: size.width * 0.4,
                          height: size.height * 0.05,

                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              );
            },
          ),
        ));
  }
}
