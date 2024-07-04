import 'package:bab_el_ezz/features/new_job-order/widgets/gray_container.dart';
import 'package:bab_el_ezz/features/staff/manager/daily_table/daily_table_cubit.dart';
import 'package:bab_el_ezz/shared_utils/utils/widget/button_widget.dart';
import 'package:bab_el_ezz/shared_utils/utils/widget/const_appbar.dart';
import 'package:bab_el_ezz/shared_utils/utils/widget/row_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

// ... other imports

class AccountClearancePage extends StatefulWidget {
  const AccountClearancePage({super.key});

  @override
  _AccountClearancePageState createState() => _AccountClearancePageState();
}

class _AccountClearancePageState extends State<AccountClearancePage> {
  DateTime? lastPayment;
  double dailyRate = 0;

  @override
  void initState() {
    super.initState();
    // You might want to fetch initial data here using the cubit
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: constAppBar(context, 'تصفية الحساب'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: BlocProvider(
          // Use BlocBuilder
          create: (context) => DailyTableCubit([]),
          child: BlocConsumer<DailyTableCubit, DailyTableState>(
            builder: (context, state) {
              final cubit = DailyTableCubit.get(context);
              if (state is DailyTableInitial) {
                var data = ModalRoute.of(context)?.settings.arguments as List;
                lastPayment = data[1];
                dailyRate = data[2];
                cubit.getTechDetails(data[0], data[1]);
                return const CircularProgressIndicator();
              }
              // Display clearance data from the cubit's state
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GrayContainer(
                    height: size.height * 0.45,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        RowText(
                            'اسم العامل  : ',
                            cubit.attends.isNotEmpty
                                ? cubit.attends[0].name
                                : '--'),
                        RowText(
                            'اخر تاريخ تصفية   : ',
                            lastPayment != null
                                ? DateFormat("dd/MM/yyy").format(lastPayment!)
                                : '--'),
                        RowText('عدد ايام العمل : ',
                            cubit.getWorkingDays().toString()),
                        RowText('عدد ايام الاجازات : ',
                            cubit.getOffDays().toString()),
                        RowText('اجمالي المكافئات  : ',
                            cubit.getTotalBonus().toString()),
                        RowText('اجمالي السلف و المصروف : ',
                            cubit.getTotalAdvance().toString()),
                        RowText('اجمالي الخصومات  : ',
                            cubit.getTotalDeduction().toString()),
                        RowText('المبلغ المستحق  : ',
                            cubit.getTotalPayment(dailyRate).toString()),
                      ],
                    ),
                  ),
                  ButtonWidget(
                    hasElevation: true,
                    text: "تصفية حساب",
                    onPressed: () {
                      cubit
                          .clearAccount(cubit.attends[0].technicianId!)
                          .then((value) => Navigator.of(context).pop());
                    }, // Call cubit method to clear account
                  )
                ],
              );
            },
            listener: (BuildContext context, DailyTableState state) {},
            // Access cubit and state
          ),
        ),
      ),
    );
  }
}
