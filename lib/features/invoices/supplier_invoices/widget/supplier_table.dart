import 'package:bab_el_ezz/features/invoices/supplier_invoices/manager/supplier_invoice/supplier_invoice_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared_utils/utils/widget/add_icon_button.dart';
import '../../../../shared_utils/utils/widget/custom_data_table.dart';
import '../../../../shared_utils/utils/widget/drop_menu.dart';

class SupplierTable extends StatelessWidget {
  const SupplierTable({super.key, required this.showAllDataSuppliers});
  final bool showAllDataSuppliers;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BlocProvider(
      create: (context) => SupplierInvoiceCubit(),
      child: BlocBuilder<SupplierInvoiceCubit, SupplierInvoiceState>(
        builder: (context, state) {
          SupplierInvoiceCubit cubit = SupplierInvoiceCubit.get(context);
          if (state is SupplierInvoiceInitial) {
            cubit.getMerchants();
            return CircularProgressIndicator();
          }

          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: CustomDataTable(
              columns: [
                DataColumn(
                    label: AddIconButton(
                  text: "إضافة تاجر/مورد",
                  onPressed: () async {
                    Navigator.pushNamed(context, 'addSuppliersData');
                    cubit.update();
                  },
                  width: size.width * 0.35,
                )),
                if (showAllDataSuppliers) ...[
                  const DataColumn(label: Text('مسلسل')),
                ],
                const DataColumn(label: Text('الاسم')),
                const DataColumn(label: Text('رقم التليفون')),
                const DataColumn(label: Text('اسم الشركة')),
                if (showAllDataSuppliers) ...[
                  const DataColumn(label: Text('عدد الفواتير')),
                  const DataColumn(label: Text('اجمالي الفواتير')),
                  const DataColumn(label: Text('اجمالي المدفوع')),
                ],
                const DataColumn(label: Text('اجمالي المتبقي')),
              ],
              rows: List.generate(
                cubit.merchants.length,
                (index) => DataRow(
                  cells: <DataCell>[
                    DataCell(DropMenu(
                      onTapEdit: (index) {},
                      onTapDelete: (index) {},
                    )),
                    if (showAllDataSuppliers) ...[
                      DataCell(Text("${index + 1}")),
                    ],
                    DataCell(Text(cubit.merchants[index].name)),
                    DataCell(Text(cubit.merchants[index].phone)),
                    DataCell(Text(cubit.merchants[index].company.toString())),
                    if (showAllDataSuppliers) ...[
                      DataCell(Text(
                          cubit.merchants[index].totalInvoices?.toString() ??
                              "--")),
                      DataCell(Text(
                          cubit.merchants[index].totalPrice?.toString() ??
                              "--")),
                      DataCell(Text(
                          cubit.merchants[index].totalPaid?.toString() ??
                              "--")),
                    ],
                    DataCell(Text(
                        cubit.merchants[index].totalRemaining?.toString() ??
                            "--")),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
