import 'package:bab_el_ezz/features/store/widget/item_table_store.dart';
import 'package:bab_el_ezz/features/store/widget/top_table_store.dart';
import 'package:bab_el_ezz/shared_utils/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../shared_utils/utils/widget/appbar_widget.dart';
import '../manager/store/store_cubit.dart';

class StorePage extends StatelessWidget {
  const StorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StoreCubit(),
      child: BlocConsumer<StoreCubit, StoreState>(
        listener: (context, state) {},
        builder: (context, state) {
          StoreCubit cubit = StoreCubit.get(context);
          return Scaffold(
            appBar: appBarWidget(context),
            body: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 5, vertical: 30),
              child: Column(
                children: [
                  topTableStore(context),
                  Expanded(
                    child: ListView.builder(
                      itemCount: cubit.items.length,
                      itemBuilder: (context, index) => cubit.items[index],
                    ),
                  ),
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                cubit.addItem(ItemTableStore());

              },
              child: const Icon(Icons.add, color: Colors.white),
              backgroundColor: ColorsAsset.kGreen,
            ),
          );
        },
      ),
    );
  }
}
