import 'package:flutter/material.dart';
import 'package:bab_el_ezz/shared_utils/utils/widget/row_text.dart';

import '../../../shared_utils/utils/widget/const_appbar.dart';
import '../../../shared_utils/utils/widget/shadow_container.dart';

class PreviousMaintenance extends StatelessWidget {
  const PreviousMaintenance({super.key});

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
                  Navigator.pushNamed(context, 'detailsMaintenancePage');
                },
                child: ListTile(
                  title: RowText(
                    'نوع الصيانة : ',
                    'صيانة دورية',
                  ),

                  subtitle:  RowText(
                    'التاريخ : ',
                    '12/12/2021',
                  ),
                ),
              );

            })

    );
  }
}
