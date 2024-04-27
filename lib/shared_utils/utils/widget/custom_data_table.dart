import 'package:bab_el_ezz/shared_utils/styles/colors.dart';
import 'package:flutter/material.dart';

import '../../styles/text.dart';

class CustomDataTable extends StatelessWidget {
  const CustomDataTable({super.key, required this.columns, required this.rows, this.horizontalMargin, this.columnSpacing});
final List<DataColumn> columns;
final List<DataRow> rows;
 final double? horizontalMargin;
 final double? columnSpacing;
  @override
  Widget build(BuildContext context) {
    return DataTable(
        dataTextStyle: AppStyles.styleRegular16(context).copyWith(color: Colors.white),
    headingTextStyle: AppStyles.styleRegular16(context).copyWith(color: Colors.white),
    showCheckboxColumn: true,


    dataRowMinHeight: MediaQuery.of(context).size.width * 0.15,
    dataRowMaxHeight: MediaQuery.of(context).size.width * 0.15,
    dividerThickness: 1,
    headingRowColor: const MaterialStatePropertyAll(ColorsAsset.kGreen),
    //horizontalMargin:horizontalMargin?? 5,
    headingRowHeight: 40,
   // columnSpacing: columnSpacing??25,

    columns: columns,
    rows: rows,
    );

  }
}
