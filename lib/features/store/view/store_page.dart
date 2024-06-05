import 'package:bab_el_ezz/data/part.dart';
import 'package:bab_el_ezz/features/store/manager/store/store_cubit.dart';
import 'package:bab_el_ezz/features/store/widget/store_table.dart';
import 'package:bab_el_ezz/shared_utils/utils/widget/show_details_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

    return BlocProvider(
      create: (context) => StoreCubit(),
      child: BlocBuilder<StoreCubit, StoreState>(
        builder: (context, state) {
          StoreCubit cubit = StoreCubit.get(context);
          if (state is StoreInitial) {
            cubit.getParts();
            return Center(child: CircularProgressIndicator());
          }
          return Scaffold(
            floatingActionButtonLocation:
                FloatingActionButtonLocation.startFloat,
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
                          parts: cubit.parts,
                          showAllData: showAllColumns,
                        )),
                  ],
                ),
              ),
            ),
            floatingActionButton: floatingButton(
              context: context,
              onPressed: () {
                Navigator.pushNamed(context, 'addItemStore')
                    .then((value) => cubit.updateParts(value as Part));
              },
              text: 'إضافة صنف',
            ),
          );
        },
      ),
    );
  }
}
