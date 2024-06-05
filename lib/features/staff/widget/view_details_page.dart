import 'package:bab_el_ezz/features/staff/manager/daily_table/daily_table_cubit.dart';
import 'package:bab_el_ezz/shared_utils/utils/widget/appbar_widget.dart';
import 'package:bab_el_ezz/shared_utils/utils/widget/custom_data_table.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../shared_utils/utils/widget/row_text.dart';
import '../../../shared_utils/utils/widget/show_details_text.dart';

class ViewDetailsPage extends StatefulWidget {
  const ViewDetailsPage({
    Key? key,
  }) : super(key: key);

  @override
  State<ViewDetailsPage> createState() => _ViewDetailsPageState();
}

class _ViewDetailsPageState extends State<ViewDetailsPage> {
  late bool showAllData = false;
  String name = '';
  String techId = '';
  DateTime lastPayment = DateTime(2020);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var data = ModalRoute.of(context)?.settings.arguments as List;

    name = data[0] ?? '';
    techId = data[1] ?? '';
    lastPayment = data[2] ?? DateTime(2020);

    return Scaffold(
      appBar: appBarWidget(context),
      body: BlocProvider(
        create: (context) => DailyTableCubit([]),
        child: BlocConsumer<DailyTableCubit, DailyTableState>(
          listener: (context, state) {},
          builder: (context, state) {
            DailyTableCubit cubit = DailyTableCubit.get(context);

            if (state is DailyTableInitial) {
              print("techId: $techId");
              print("lastPay: $lastPayment");
              cubit.getTechDetails(techId, lastPayment, getAll: true);
              var data = ModalRoute.of(context)?.settings.arguments as List;
              name = data[0];
              techId = data[1];
              lastPayment = data[2] ?? DateTime(2020);
              return const CircularProgressIndicator();
            }

            return SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: RowText("اسم العامل :", name),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  showDetailsText(
                      context: context,
                      onPressed: () {
                        setState(() {
                          showAllData = !showAllData;
                        });
                      },
                      showAll: false),
                  const SizedBox(
                    height: 20,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: CustomDataTable(
                      columns: [
                        const DataColumn(label: Text(' التاريخ ')),
                        const DataColumn(label: Text(' عمل /اجازة ')),
                        if (showAllData) ...[
                          const DataColumn(label: Text(' وقت الحضور ')),
                          const DataColumn(label: Text(' وقت االانصراف ')),
                          const DataColumn(label: Text(' مكافأة ')),
                          const DataColumn(label: Text(' خصم ')),
                          const DataColumn(label: Text(' سلفة-مصروف ')),
                          const DataColumn(label: Text(' ملاحظات ')),
                        ],
                        const DataColumn(label: Text(' تصفية حساب ')),
                      ],
                      rows: List.generate(
                        cubit.attends.length,
                        (index) => DataRow(cells: <DataCell>[
                          DataCell(Text(DateFormat("dd/MM/yyyy")
                              .format(cubit.attends[index].date!))),
                          DataCell(Text(cubit.attends[index].status!)),
                          if (showAllData) ...[
                            DataCell(Text(cubit.attends[index].arrivalTime!
                                .format(context))),
                            DataCell(Text(cubit.attends[index].departureTime!
                                .format(context))),
                            DataCell(Text(
                                cubit.attends[index].bonus?.toString() ??
                                    '--')),
                            DataCell(Text(
                                cubit.attends[index].deduction?.toString() ??
                                    '--')),
                            DataCell(Text(
                                cubit.attends[index].advance?.toString() ??
                                    '--')),
                            DataCell(Text(
                                cubit.attends[index].notes?.toString() ??
                                    '--')),
                          ],
                          DataCell(Text(
                              cubit.attends[index].date!.isAfter(lastPayment)
                                  ? '--'
                                  : 'تم تصفية الحساب')),
                        ]),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
