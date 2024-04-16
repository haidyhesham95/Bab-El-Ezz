import 'package:bab_el_ezz/features/store/widget/top_table_store.dart';
import 'package:bab_el_ezz/shared_utils/styles/colors.dart';
import 'package:flutter/material.dart';
import '../../../shared_utils/utils/widget/appbar_widget.dart';
import '../../../shared_utils/utils/widget/white_container.dart';

class StorePage extends StatefulWidget {
  const StorePage({Key? key}) : super(key: key);

  @override
  _StorePageState createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  List<Widget> items = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(context),
      body:
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0,vertical: 30),
        child: Column(
          children: [
           topTableStore(context),
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) => items[index],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            items.add(
              Row(
                children: [
                  WhiteContainer(text: 'ggdddddddddd'),
                  WhiteContainer(text: 'gg', flex: 4),
                  WhiteContainer(text: 'raearefd', flex: 4),
                  WhiteContainer(text: 'mjhjg'),
                  WhiteContainer(text: 'jyhj'),
                  WhiteContainer(text: 'ghgh', flex: 4),
                  WhiteContainer(text: 'ghgj', flex: 3),
                  WhiteContainer(text: 'hjgjg'),
                ],
              ),
            );
          });
        },
        child: const Icon(Icons.add, color: Colors.white),
        backgroundColor: ColorsAsset.kGreen,
      ),

    );
  }
}

