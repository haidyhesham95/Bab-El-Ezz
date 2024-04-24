import 'package:bab_el_ezz/features/store/widget/store_table.dart';
import 'package:bab_el_ezz/shared_utils/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../shared_utils/utils/widget/appbar_widget.dart';
import '../manager/store/store_cubit.dart';
import '../widget/item_table_store.dart';

class StorePage extends StatelessWidget {
  const StorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StoreCubit(),
      child: BlocConsumer<StoreCubit, StoreState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = StoreCubit.get(context);
          return Scaffold(
            appBar: appBarWidget(context),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5,),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SingleChildScrollView(
                  child: StoreTable(
                    rows: cubit.items,
                  ),
                ),
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                cubit.addItem(itemStoreTable());
              },
              backgroundColor: ColorsAsset.kGreen,
              child: const Icon(Icons.add, color: Colors.white),
            ),
          );
        },
      ),
    );
  }


}
