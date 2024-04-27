import 'package:bab_el_ezz/features/store/widget/store_table.dart';
import 'package:bab_el_ezz/shared_utils/styles/colors.dart';
import 'package:flutter/material.dart';
import '../../../shared_utils/utils/widget/appbar_widget.dart';


class StorePage extends StatelessWidget {
  const StorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
            appBar: appBarWidget(context),
            body: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 5,),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SingleChildScrollView(
                  child: StoreTable(),
                ),
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.pushNamed(context, 'addItemStore');
              },
              backgroundColor: ColorsAsset.kGreen,
              child: const Icon(Icons.add, color: Colors.white),
            ),
          );

  }


}
