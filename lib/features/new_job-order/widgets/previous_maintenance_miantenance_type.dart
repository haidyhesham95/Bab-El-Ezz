import 'package:bab_el_ezz/data/job_order.dart';
import 'package:bab_el_ezz/shared_utils/utils/widget/row_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../shared_utils/utils/widget/const_appbar.dart';
import '../../../shared_utils/utils/widget/shadow_container.dart';
import 'details_maintenence_maintenance_type.dart';

class PreviousMaintenanceType extends StatelessWidget {
  const PreviousMaintenanceType(
      {super.key, this.chooseItem = false, required this.pastOrders});

  final bool chooseItem;
  final List<JobOrder> pastOrders;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: constAppBar(context, "الصيانات السابقه "),
      body: pastOrders.isEmpty
          ? Center(
              child: Text("لا يوجد صيانات سابقة"),
            )
          : ListView.separated(
              padding: const EdgeInsets.symmetric(vertical: 20),
              separatorBuilder: (context, index) => const SizedBox(height: 20),
              itemCount: pastOrders.length,
              itemBuilder: (context, index) {
                return ShadowContainer(
                  radius: 10,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              DetailsMaintenancePageType(pastOrders[index])),
                    );
                  },
                  child: ListTile(
                    title: RowText(
                      'نوع الصيانة : ',
                      pastOrders[index].maintenanceType ?? '',
                    ),
                    subtitle: RowText(
                      'التاريخ : ',
                      DateFormat("yyyy/MM/dd")
                          .format(pastOrders[index].endDate ?? DateTime.now()),
                    ),
                    trailing: chooseItem
                        ? ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context, pastOrders[index]);
                            },
                            child: const Text('اختر'), // Arabic for "Choose"
                          )
                        : null,
                  ),
                );
              },
            ),
    );
  }
}
