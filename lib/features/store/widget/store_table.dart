import 'package:bab_el_ezz/data/part.dart';
import 'package:bab_el_ezz/features/store/manager/store/store_cubit.dart';
import 'package:bab_el_ezz/shared_utils/utils/widget/custom_data_table.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared_utils/utils/widget/drop_menu.dart';

class StoreTable extends StatelessWidget {
  const StoreTable({Key? key, required this.showAllData, required this.parts})
      : super(key: key);

  final bool showAllData;
  final List<Part> parts;

  @override
  Widget build(BuildContext context) {
    print("parts: ${parts.length}");
    return BlocProvider(
      create: (context) => StoreCubit(),
      child: BlocBuilder<StoreCubit, StoreState>(
        builder: (context, state) {
          return CustomDataTable(
            columns: [
              const DataColumn(label: Text('  ')),
              const DataColumn(label: Text(' مسلسل ')),
              const DataColumn(label: Text(' اسم الصنف ')),
              const DataColumn(label: Text(' الكمية ')),
              if (showAllData) ...[
                const DataColumn(label: Text(' كود الصنف ')),
                const DataColumn(label: Text(' الماركة ')),
                const DataColumn(label: Text(' سعر الجملة ')),
                const DataColumn(label: Text(' سعر البيع ')),
                const DataColumn(label: Text(' تنبيه ')),
              ],
            ],
            rows: List.generate(
              parts.length,
              (index) => DataRow(
                cells: <DataCell>[
                  DataCell(
                    DropMenu(
                      onTapEdit: (index) {},
                      onTapDelete: (index) {},
                    ),
                  ),
                  DataCell(Text("${index + 1}")),
                  DataCell(Text(parts[index].name)),
                  DataCell(Text(parts[index].quantity.toString())),
                  if (showAllData) ...[
                    DataCell(Text(parts[index].code)),
                    DataCell(Text(parts[index].brand)),
                    DataCell(Text(parts[index].wholesalePrice.toString())),
                    DataCell(Text(parts[index].sellingPrice.toString())),
                    DataCell(Text(parts[index].lowStockThreshold.toString())),
                  ],
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
