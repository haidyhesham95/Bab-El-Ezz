import 'package:bab_el_ezz/shared_utils/utils/widget/row_text.dart';
import 'package:flutter/material.dart';

import '../../../shared_utils/utils/widget/const_appbar.dart';
import '../../../shared_utils/utils/widget/shadow_container.dart';
import '../../../shared_utils/utils/widget/show_details_text.dart';
import 'details_maintenance_table.dart';

class DetailsMaintenancePage extends StatefulWidget {
  const DetailsMaintenancePage({super.key});

  @override
  State<DetailsMaintenancePage> createState() => _DetailsMaintenancePageState();
}

class _DetailsMaintenancePageState extends State<DetailsMaintenancePage> {
  late bool showAllData= false;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: constAppBar(context, "تفاصيل الصيانة"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            SizedBox(
              height: size.height * 0.2,
              child: ShadowContainer(
                radius: 10,
                onTap: () {},
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      RowText(
                        'التاريخ : ',
                        '12/12/2021',

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
        
            const SizedBox(height: 20),
            showDetailsText(context: context, onPressed: (){
              setState(() {
                showAllData = !showAllData;
              });
            }),
            DetailsMaintenanceTable(showAllDataInvoices: showAllData,),

            const SizedBox(height: 20),

          ],
        ),
      )

    );
  }
}
