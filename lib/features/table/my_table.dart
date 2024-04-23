import 'package:bab_el_ezz/shared_utils/styles/colors.dart';
import 'package:flutter/material.dart';
import '../../shared_utils/styles/text.dart';
import '../../shared_utils/utils/widget/button_widget.dart';

class MyTable extends StatefulWidget {
  const MyTable({super.key});

  @override
  _MyTableState createState() => _MyTableState();
}

class _MyTableState extends State<MyTable> {
  List<DataRow> rows = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SingleChildScrollView(
            child: DataTable(
              dividerThickness: 2.0,
              headingTextStyle: const TextStyle(color: Colors.black),
              headingRowColor: const MaterialStatePropertyAll(Colors.white),
              horizontalMargin: 5,
              headingRowHeight: 50,
              columnSpacing: 10.0,
              columns: [
                DataColumn(
                  label: Container(
                    child: IconButton(
                        onPressed: () {
                          setState(() {
                            addRow();
                          });
                        },
                        icon: const Icon(Icons.add)),
                  ),
                ),
                const DataColumn(label: Text(' عمل/اجازة ')),
                const DataColumn(label: Text(' وقت الحضور ')),
                const DataColumn(label: Text(' وقت الانصراف ')),
                const DataColumn(label: Text(' مكافأه ')),
                const DataColumn(label: Text(' خصم ')),
                const DataColumn(label: Text(' سلفة-مصروف ')),
                const DataColumn(label: Text(' ملاحظات ')),
                const DataColumn(label: Text(' تصفية حساب ')),
              ],
              rows: rows,
            ),
          ),
        ),
      ),
    );
  }

  void addRow() {
    setState(() {
      rows.add(
        DataRow(
          cells: [
            DataCell(Container()),
            DataCell(
              Container(
                margin: const EdgeInsets.only(left: 1),
                padding: const EdgeInsets.all(12),
                color: ColorsAsset.kGreen,
                child: const Text('hhhhhhhhhhhh ',
                    style: TextStyle(color: Colors.white)),
              ),
            ),
            DataCell(
              Container(
                padding: const EdgeInsets.all(12),
                child: const Text('dfdd', style: TextStyle(color: Colors.white)),
              ),
            ),
            DataCell(
              Container(
                padding: const EdgeInsets.all(12),
                child: const Text('Data', style: TextStyle(color: Colors.white)),
              ),
            ),
            DataCell(
              Container(
                padding: const EdgeInsets.all(12),
                child: const Text('Data', style: TextStyle(color: Colors.white)),
              ),
            ),
            DataCell(
              Container(
                padding: const EdgeInsets.all(12),
                child: const Text('Data', style: TextStyle(color: Colors.white)),
              ),
            ),
            DataCell(
              Container(
                padding: const EdgeInsets.all(12),
                child: const Text('Data', style: TextStyle(color: Colors.white)),
              ),
            ),
            DataCell(
              Container(
                padding: const EdgeInsets.all(12),
                child:
                    const Text('Datsdsdsdsa', style: TextStyle(color: Colors.white)),
              ),
            ),
            DataCell(
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 1),
                height: 50,
                width: 100,
                child: Center(
                    child: ButtonWidget(
                  height: 22,
                  onPressed: () {
                    Navigator.of(context).pushNamed('accountClearancePage');
                  },
                  text: 'تصفية حساب',
                  fontStyle: AppStyles.styleLight13(context),
                  borderRadius: 4,
                )),
              ),
            ),
          ],
        ),
      );
    });
  }
}
