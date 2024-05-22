import 'package:bab_el_ezz/features/store/widget/store_table.dart';
import 'package:bab_el_ezz/shared_utils/utils/widget/show_details_text.dart';
import 'package:flutter/material.dart';

import '../../../shared_utils/utils/widget/appbar_widget.dart';
import '../../../shared_utils/utils/widget/floating_button.dart';

class StorePage extends StatefulWidget {
  const StorePage({Key? key}) : super(key: key);

  @override
  State<StorePage> createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  bool showAllColumns = false;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      appBar: appBarWidget(context),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 5,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              showDetailsText(
                context: context,
                showAll: showAllColumns,
                onPressed: () {
                  setState(() {
                    showAllColumns = !showAllColumns;
                  });
                },
              ),
              SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: StoreTable(
                    showAllData: showAllColumns,
                  )),
            ],
          ),
        ),
      ),
      floatingActionButton: floatingButton(
        context: context,
        onPressed: () {
          Navigator.pushNamed(context, 'addItemStore');
        },
        text: 'إضافة صنف',
      ),
    );
  }
}
