import 'package:bab_el_ezz/data/merchant.dart';
import 'package:bab_el_ezz/features/invoices/invoices/widget/top_invoice_search.dart';
import 'package:bab_el_ezz/features/invoices/supplier_invoices/manager/supplier_invoice/supplier_invoice_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared_utils/utils/widget/add_icon_button.dart';
import '../../../../shared_utils/utils/widget/custom_data_table.dart';
import '../../../../shared_utils/utils/widget/drop_menu.dart';
import '../../../../shared_utils/utils/widget/show_details_text.dart';

class SupplierTable extends StatelessWidget {
  SupplierTable({super.key});
  TextEditingController merchantController = TextEditingController();
  List<Merchant> merchants = [];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BlocProvider(
      create: (context) => SupplierInvoiceCubit(),
      child: BlocBuilder<SupplierInvoiceCubit, SupplierInvoiceState>(
        builder: (context, state) {
          SupplierInvoiceCubit cubit = context.read<SupplierInvoiceCubit>();

          if (state is SupplierInvoiceInitial) {
            cubit.getMerchants();
            return CircularProgressIndicator();
          }
          print("state: $state}");
          if (state is SearchData) {
            var data = state.data;
            if (data is List<Merchant>) {
              merchants = state.data as List<Merchant>;
              print("data: ${data.length}");
            }
          }

          return Column(
            children: [
              TopInvoicesSearch(
                controller: merchantController,
                onPressedSearch: () {
                  cubit.searchMerchant(merchantController.text);
                },
                height: 70,
                text: " قائمة الموردين/ التجار",
                hintText: ' بحث عن مورد/تاجر ',
              ),
              showDetailsText(
                  context: context,
                  onPressed: () {
                    cubit.updateShowAll();
                  },
                  showAll: false),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: CustomDataTable(
                  columns: [
                    DataColumn(
                        label: AddIconButton(
                      text: "إضافة تاجر/مورد",
                      onPressed: () async {
                        Merchant merchant = await Navigator.pushNamed(
                            context, 'addSuppliersData') as Merchant;
                        cubit.updateMerchants(merchant);
                      },
                      width: size.width * 0.35,
                    )),
                    if (cubit.showAllDataSuppliers) ...[
                      const DataColumn(label: Text('مسلسل')),
                    ],
                    const DataColumn(label: Text('الاسم')),
                    const DataColumn(label: Text('رقم التليفون')),
                    const DataColumn(label: Text('اسم الشركة')),
                    if (cubit.showAllDataSuppliers) ...[
                      const DataColumn(label: Text('عدد الفواتير')),
                      const DataColumn(label: Text('اجمالي الفواتير')),
                      const DataColumn(label: Text('اجمالي المدفوع')),
                    ],
                    const DataColumn(label: Text('اجمالي المتبقي')),
                  ],
                  rows: List.generate(
                    merchants.length,
                    (index) => DataRow(
                      cells: <DataCell>[
                        DataCell(DropMenu(
                          index: index,
                          onTapEdit: (index) async {
                            print("index: $index");
                            print("merchId: ${merchants[index].id}");
                            final merchant = await Navigator.of(context)
                                    .pushNamed('addSuppliersData',
                                        arguments: merchants[index].toJson())
                                as Merchant;
                            cubit.updateMerchants(merchant, update: true);
                          },
                          onTapDelete: (index) {
                            cubit.deleteMerchant(merchants[index]);
                          },
                        )),
                        if (cubit.showAllDataSuppliers) ...[
                          DataCell(Text("${index + 1}")),
                        ],
                        DataCell(Text(merchants[index].name)),
                        DataCell(Text(merchants[index].phone)),
                        DataCell(Text(merchants[index].company.toString())),
                        if (cubit.showAllDataSuppliers) ...[
                          DataCell(Text(
                              merchants[index].totalInvoices?.toString() ??
                                  "--")),
                          DataCell(Text(
                              merchants[index].totalPrice?.toString() ?? "--")),
                          DataCell(Text(
                              merchants[index].totalPaid?.toString() ?? "--")),
                        ],
                        DataCell(Text(
                            merchants[index].totalRemaining?.toString() ??
                                "--")),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
