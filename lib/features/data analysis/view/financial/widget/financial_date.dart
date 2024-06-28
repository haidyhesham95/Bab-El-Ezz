
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../../../../shared_utils/styles/colors.dart';
import '../../../../../shared_utils/styles/text.dart';
import '../manager/financial_cubit.dart';

class FinancialDate extends StatefulWidget {
  const FinancialDate({super.key});

  @override
  _FinancialDateState createState() => _FinancialDateState();
}

class _FinancialDateState extends State<FinancialDate> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => FinancialCubit(),
      child: BlocBuilder<FinancialCubit, FinancialState>(
        builder: (context, state) {
          FinancialCubit cubit = FinancialCubit.get(context);
          return InkWell(
            onTap: ()  {
              cubit.getDateRange(context);
            },
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: ColorsAsset.kGreen),
              ),
              child: Center(
                child: Text(
                  cubit.selectedRange == null
                      ? ' اختر التاريخ من - إلى: '
                      : ' من : ${DateFormat('yyyy-MM-dd').format(cubit.selectedRange!.start)}  -  الي ${DateFormat('yyyy-MM-dd').format(cubit.selectedRange!.end)} ',
                  style: AppStyles.styleMedium16(context),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}


