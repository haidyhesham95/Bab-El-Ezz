import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../shared_utils/styles/text.dart';
import '../../../shared_utils/utils/widget/button_widget.dart';
import '../../../shared_utils/utils/widget/white_container.dart';
import '../../new_job-order/widgets/drop_button.dart';
import '../manager/daily_table/daily_table_cubit.dart';

class ItemDailyTable extends StatelessWidget {
  const ItemDailyTable({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DailyTableCubit(),
      child: BlocBuilder<DailyTableCubit, DailyTableState>(
        builder: (context, state) {
          DailyTableCubit cubit = DailyTableCubit.get(context);
      return Row(
          children: [
        const WhiteContainer(text: ''),
        const SizedBox(
          width: 1,
        ),
        SizedBox(
         width: 50,
          child: DropButton(
            styleValue: AppStyles.styleRegular10(context),
            color: Colors.white,
            height: 25,
            hintText: 'عمل',
            borderRadius: 0,
            padding: const EdgeInsets.symmetric(horizontal: 2),
            styleHint: AppStyles.styleRegular10(context),
            iconSize: 10,
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
        ),
        const SizedBox(
          width: 1,
        ),
        const WhiteContainer(text: ''),
        const SizedBox(
          width: 1,
        ),
        const WhiteContainer(text: '',width: 70,),
        const SizedBox(
          width: 1,
        ),
        const WhiteContainer(text: ''),
        const SizedBox(
          width: 1,
        ),
        const WhiteContainer(
          text: '',
        ),
        const SizedBox(
          width: 1,
        ),
        const WhiteContainer(text: '', width: 70,),
        const SizedBox(
          width: 1,
        ),
        const WhiteContainer(
          text: '',
          width: 70,
        ),
        const SizedBox(
          width: 1,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 1),
          height: 25,
          width: 70,
          color: Colors.white,
          child: Center(
              child: ButtonWidget(
                height: 22,
                onPressed: () {
                  Navigator.of(context).pushNamed('accountClearancePage');
                },
                text: 'تصفية حساب',
                fontStyle: AppStyles.styleRegular8(context),
                borderRadius: 4,
              )),
        ),
      ]);
    },
      ),
    );
  }
}
