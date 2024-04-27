import 'package:bab_el_ezz/shared_utils/utils/widget/action_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../shared_utils/styles/colors.dart';
import '../../../shared_utils/styles/text.dart';
import '../../../shared_utils/utils/widget/button_widget.dart';
import '../../../shared_utils/utils/widget/const_appbar.dart';
import '../../../shared_utils/utils/widget/text_field.dart';
import '../../new_job-order/widgets/drop_button.dart';
import '../manager/daily_table/daily_table_cubit.dart';

class AddDailyItem extends StatelessWidget {
  const AddDailyItem({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BlocProvider(
        create: (context) => DailyTableCubit(),
        child: BlocBuilder<DailyTableCubit, DailyTableState>(
            builder: (context, state) {
          DailyTableCubit cubit = DailyTableCubit.get(context);
          return Scaffold(
              appBar: constAppBar(context, ' اضافة ',
                  actions: [
                   actionButton(context, () {
                          if (cubit.formKey.currentState!.validate()) {
                            Navigator.pop(context);
                          }
                        },)]),

              body: SingleChildScrollView(
                  child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Form(
                  key: cubit.formKey,
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      TextFieldWidget(
                        label: " اسم الفني ",
                        hintText: "  اسم الفني ",
                        controller: cubit.nameController,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.name,
                      ),
                      const SizedBox(height: 15),
                      DropButton(
                        styleHint: AppStyles.styleRegular14(context)
                            .copyWith(color: ColorsAsset.kDarkBrown),
                        height: 50,
                        color: Colors.white,
                        hintText: 'عمل',
                        borderRadius: 10,
                        value: cubit.selectedType,
                        onChanged: (String? value) {
                          cubit.setSelectedType(value);
                        },
                        items: const [
                          DropdownMenuItem(
                            value: 'عمل',
                            child: Text('عمل '),
                          ),
                          DropdownMenuItem(
                            value: 'اجازة',
                            child: Text('اجازة '),
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      TextFieldWidget(
                        label: " ملاحظات ",
                        hintText: " ملاحظات ",
                        maxLines: 3,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.name,
                      ),
                    ],
                  ),
                ),
              )));
        }));
  }
}
