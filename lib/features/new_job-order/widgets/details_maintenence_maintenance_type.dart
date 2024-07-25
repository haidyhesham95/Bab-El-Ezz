import 'package:bab_el_ezz/data/job_order.dart';
import 'package:bab_el_ezz/shared_utils/utils/widget/row_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../shared_utils/utils/widget/const_appbar.dart';
import '../../../shared_utils/utils/widget/shadow_container.dart';
import 'details_maintenance_table.dart';

class DetailsMaintenancePageType extends StatelessWidget {
  DetailsMaintenancePageType(this.pastOrder, {super.key});

  JobOrder pastOrder;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: constAppBar(context, "تفاصيل الصيانة"),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 20),
                SizedBox(
                  height: size.height * 0.2,
                  width: size.width * 0.9,
                  child: ShadowContainer(
                      radius: 10,
                      onTap: () {},
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RowText(
                                'التاريخ : ',
                                DateFormat("yyyy/MM/dd").format(
                                    pastOrder.endDate ?? DateTime.now()),
                              ),
                              RowText(
                                'اسم الفني : ',
                                pastOrder.technicians?.join("\n") ?? '',
                              ),
                              RowText(
                                'نوع الصيانة : ',
                                pastOrder.maintenanceType ?? '',
                              ),
                              RowText(
                                'الملاحظات : ',
                                pastOrder.notes ?? '',
                              ),
                            ]),
                      )),
                ),
                const SizedBox(height: 30),
                DetailsMaintenanceTable(pastOrder.invoice?.parts ?? []),
                const SizedBox(height: 20),
                // ButtonWidget(
                //   child: Text("ربط هذه الصيانة بالعطل المتكرر",
                //       style: AppStyles.styleMedium18White(context)),
                //   onPressed: () {},
                // ),
              ],
            ),
          ),
        ));
  }
}
