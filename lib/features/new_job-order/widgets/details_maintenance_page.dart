import 'package:bab_el_ezz/shared_utils/utils/widget/row_text.dart';
import 'package:flutter/material.dart';

import '../../../shared_utils/utils/widget/const_appbar.dart';
import '../../../shared_utils/utils/widget/shadow_container.dart';
import 'details_maintenance_table.dart';

class DetailsMaintenancePage extends StatelessWidget {
  const DetailsMaintenancePage({super.key});

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
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RowText(
                          'التاريخ : ',
                          '12/12/2021',

                        ),
                        RowText(
                          'اسم الفني : ',
                          'الاسم',

                        ),
                        RowText(
                          'نوع الصيانة : ',
                          'صيانة دورية',
                        ),
                        RowText(
                          'الملاحظات : ',
                          '-------',
                        ),

                                 ]),
                  )),
              ),

              const SizedBox(height: 30),

              const DetailsMaintenanceTable(),

              const SizedBox(height: 20),

            ],
          ),
        ),
      )

    );
  }
}
