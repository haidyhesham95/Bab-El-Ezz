import 'package:bab_el_ezz/shared_utils/utils/widget/custom_data_table.dart';
import 'package:flutter/material.dart';
import '../../../shared_utils/utils/widget/const_appbar.dart';
import '../../../shared_utils/utils/widget/row_text.dart';
import '../../../shared_utils/utils/widget/show_details_text.dart';


class ViewDetailsPage extends StatefulWidget {
  const ViewDetailsPage({Key? key,}) : super(key: key);

  @override
  State<ViewDetailsPage> createState() => _ViewDetailsPageState();
}

class _ViewDetailsPageState extends State<ViewDetailsPage> {
  late bool showAllData= false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
             appBar: constAppBar(context, 'عرض التفاصيل'),

          body:  SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: const RowText("اسم العامل :", "الاسم ..."),
              ),
              const SizedBox(height: 20,),
              showDetailsText(context: context, onPressed: (){
                setState(() {
                  showAllData = !showAllData;
                });
              }),
              const SizedBox(height: 20,),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: CustomDataTable(
                      columns:  [
                        DataColumn(label: Text(' التاريخ ')),
                        DataColumn(label: Text(' عمل /اجازة ')),
                        if (showAllData) ...[
                        DataColumn(label: Text(' وقت الحضور ')),
                        DataColumn(label: Text(' وقت االانصراف ')),
                        DataColumn(label: Text(' مكافأة ')),
                        DataColumn(label: Text(' خصم ')),
                        DataColumn(label: Text(' سلفة-مصروف ')),
                        DataColumn(label: Text(' ملاحظات ')),
                        ],
                        DataColumn(label: Text(' تصفية حساب ')),
                      ],
                      rows: List.generate(
                        5,
                            (index) => DataRow(cells: <DataCell>[
                          DataCell( Text('12/2/2024')),
                          DataCell( Text('عمل')),
                        if (showAllData) ...[
                          DataCell( Text('9:00pm.')),
                          DataCell(Text('5:00pm.')),
                              const DataCell(Text('---')),
                              const DataCell(Text('5%')),
                              const DataCell(Text('200')),
                          const DataCell(Text('----')),
                             ],
                             DataCell(Text('تم تصفية الحساب')),

                        ]),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10,),

                ],
              ),
            ),
          );

  }
}
