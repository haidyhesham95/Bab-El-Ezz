import 'package:bab_el_ezz/shared_utils/utils/widget/row_text.dart';
import 'package:flutter/material.dart';

import '../../../shared_utils/utils/widget/const_appbar.dart';
import '../../../shared_utils/utils/widget/shadow_container.dart';
import 'details_maintenence_maintenance_type.dart';

class PreviousMaintenanceType extends StatelessWidget {
  const PreviousMaintenanceType({super.key, this.chooseItem = false});

  final bool chooseItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: constAppBar(context, "الصيانات السابقه "),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 20),
        separatorBuilder: (context, index) => const SizedBox(height: 20),
        itemCount: 10,
        itemBuilder: (context, index) {
          return ShadowContainer(
            radius: 10,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const DetailsMaintenancePageType()),
              );
            },
            child: ListTile(
              title: const RowText(
                'نوع الصيانة : ',
                'صيانة دورية',
              ),
              subtitle: const RowText(
                'التاريخ : ',
                '12/12/2021',
              ),
              trailing: chooseItem
                  ? ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
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
