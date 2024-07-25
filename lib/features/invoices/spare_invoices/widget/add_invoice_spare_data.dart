import 'package:bab_el_ezz/data/customer.dart';
import 'package:bab_el_ezz/data/part.dart';
import 'package:bab_el_ezz/data/part_customer.dart';
import 'package:bab_el_ezz/data/spare_invoice.dart';
import 'package:bab_el_ezz/features/invoices/invoices/widget/top_invoice_search.dart';
import 'package:bab_el_ezz/shared_utils/utils/widget/button_widget.dart';
import 'package:bab_el_ezz/shared_utils/utils/widget/const_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../shared_utils/styles/text.dart';
import '../../../new_job-order/widgets/gray_container.dart';
import '../manager/spare_invoices/spare_invoices_cubit.dart';
import 'add_invoice_spare_row_table.dart';
import 'add_invoice_spare_table.dart';

class AddInvoiceSpareData extends StatelessWidget {
  AddInvoiceSpareData({super.key});

  List<Customer> customers = [];
  List<Part> searchResults = [];
  String customerName = '';
  String phoneNumber = '';

  Part? selectedPart;

  double totalPrice = 0;

  bool isUpdate = false;
  SpareInvoice? invoice;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BlocProvider(
      create: (context) => SpareInvoicesCubit(),
      child: BlocConsumer<SpareInvoicesCubit, SpareInvoicesState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = context.read<SpareInvoicesCubit>();

          // Fetch initial data on first build
          if (state is SpareInvoicesInitial) {
            _setupInitialData(cubit);
            invoice =
                ModalRoute.of(context)?.settings.arguments as SpareInvoice?;
            if (invoice != null && !isUpdate) {
              customerName = invoice!.clientName;
              phoneNumber = invoice!.phoneNumber;
              cubit.updateTableView(customerName, phoneNumber);
              for (var part in invoice!.parts) {
                cubit.partController.text = part.name;
                cubit.quantityController.text = part.quantity.toString();
                cubit.priceController.text = part.sellingPrice.toString();
                onAddPressed(cubit);
              }
            }
          }

          // Update search results or customer list based on state
          if (state is SearchData) {
            _updateDataFromState(state);
          }

          return Scaffold(
            appBar: constAppBar(context, 'إضافة فاتورة جديدة'),
            body: _buildBody(context, size, cubit),
          );
        },
      ),
    );
  }

  // Separate function for building the body
  Widget _buildBody(BuildContext context, Size size, SpareInvoicesCubit cubit) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
        height: size.height,
        child: Form(
          key: cubit.formKey1,
          child: Column(
            children: [
              _buildGrayContainer(context, size, cubit),
              if (cubit.isTableVisible) ...[
                if (searchResults.isNotEmpty)
                  ...List.generate(
                      searchResults.length,
                      (index) => ListTile(
                            title: Text(searchResults[index].name),
                            onTap: (searchResults[index].quantity > 0)
                                ? () {
                                    selectedPart = searchResults[index];
                                    cubit.partController.text =
                                        searchResults[index].name;
                                    cubit.priceController.text =
                                        searchResults[index]
                                            .sellingPrice
                                            .toString();
                                    searchResults.clear();
                                    cubit.update();
                                  }
                                : () {
                                    Fluttertoast.showToast(
                                        msg: "لا يوجد مخزون");
                                  },
                          )),
                _buildAddInvoiceSpareTable(context, cubit, size),
              ] else ...[
                _buildCustomerList(context, cubit),
              ],
            ],
          ),
        ),
      ),
    );
  }

  // Separate function for building the GrayContainer
  Widget _buildGrayContainer(
      BuildContext context, Size size, SpareInvoicesCubit cubit) {
    return GrayContainer(
      height: cubit.isTableVisible ? size.height * 0.33 : size.height * 0.22,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TopInvoicesSearch(
            controller: cubit.searchController,
            onPressedSearch: () {
              cubit.isTableVisible = false;
              cubit.update();
              cubit.searchCustomer();
            },
            hintText: "البحث عن عميل بالاسم أو رقم التليفون",
            showText: false,
          ),
          if (cubit.isTableVisible) ...[
            Text("اسم العميل: ${cubit.customerNameController.text}"),
            Text("رقم الهاتف: ${cubit.customerPhoneController.text}")
          ],
          ElevatedButton(
            onPressed: () async {
              PartCustomer customer = await Navigator.pushNamed(
                  context, 'AddCustomerInSpareInvoice') as PartCustomer;
              cubit.addCustomer(customer);
            },
            child: Text(
              'اضافه عميل',
              style: AppStyles.styleRegular14(context)
                  .copyWith(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  // Separate function for building the AddInvoiceSpareTable
  Widget _buildAddInvoiceSpareTable(
      BuildContext context, SpareInvoicesCubit cubit, Size size) {
    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: AddInvoiceSpareTable(
            rows: cubit.items,
          ),
        ),
        const SizedBox(height: 20),
        ButtonWidget(
          hasElevation: true,
          height: size.height * 0.05,
          text: ' إضافة  ',
          onPressed: () {
            print("onPressed: ${cubit.invoice.price}");
            cubit.invoice.invoiceNumber = (invoice?.invoiceNumber ?? '');
            cubit.invoice.clientName = cubit.customerNameController.text;
            cubit.invoice.phoneNumber = cubit.customerPhoneController.text;
            Navigator.of(context).pop(cubit.invoice);
          },
        ),
      ],
    );
  }

  // Separate function for building the customer list
  Widget _buildCustomerList(BuildContext context, SpareInvoicesCubit cubit) {
    return Column(
      children: List.generate(customers.length, (index) {
        return ListTile(
          title: Text(customers[index].name),
          subtitle: Text(customers[index].phoneNumber),
          onTap: () {
            customerName = customers[index].name;
            phoneNumber = customers[index].phoneNumber;
            cubit.updateTableView(
                customers[index].name, customers[index].phoneNumber);
          },
        );
      }),
    );
  }

  void _setupInitialData(SpareInvoicesCubit cubit) {
    // totalPrice = 0;
    cubit.partController.addListener(() {
      cubit.searchPart(cubit.partController.text);
    });

    cubit.discountController.addListener(() {
      cubit.totalController.text =
          (totalPrice - (double.tryParse(cubit.discountController.text) ?? 0))
              .toString();
      cubit.updateTotalPrice(addInvoiceSpareRowTable(
        [
          cubit.partController,
          cubit.quantityController,
          cubit.totalController,
          cubit.notesController,
        ],
        total: true,
      ));
    });
    cubit.getCustomers();
    cubit.getParts();

    cubit.addItem(addInvoiceSpareRowTable(
      [
        cubit.partController,
        cubit.quantityController,
        cubit.totalController,
        cubit.notesController,
      ],
      total: true,
    ));

    cubit.addItem(addInvoiceSpareRowTable(
      [
        cubit.partController,
        cubit.quantityController,
        cubit.discountController,
        cubit.notesController,
      ],
      discount: true,
    ));

    cubit.addItem(addInvoiceSpareRowTable([
      cubit.partController,
      cubit.quantityController,
      cubit.priceController,
      cubit.notesController,
    ], onAddPressed: () {
      onAddPressed(cubit);
    }, footer: true));
  }

  void _updateDataFromState(SearchData state) {
    final data = state.data;
    if (data is List<Customer>) {
      customers = data;
    } else if (data is List<Part>) {
      searchResults = data;
    }
  }

  void onAddPressed(SpareInvoicesCubit cubit) {
    print("${cubit.quantityController.text}, ${selectedPart?.quantity}");
    if (cubit.partController.text.isNotEmpty &&
        cubit.quantityController.text.isNotEmpty &&
        cubit.priceController.text.isNotEmpty &&
        int.parse(cubit.quantityController.text) <
            (selectedPart?.quantity ?? double.infinity)) {
      totalPrice += (double.parse(cubit.priceController.text) *
          int.parse(cubit.quantityController.text));
      print("total: $totalPrice");
      cubit.totalController.text = totalPrice.toString();

      cubit.updateTotalPrice(addInvoiceSpareRowTable(
        [
          cubit.partController,
          cubit.quantityController,
          cubit.totalController,
          cubit.notesController,
        ],
        total: true,
      ));

      cubit.addItem(
        addInvoiceSpareRowTable([
          cubit.partController,
          cubit.quantityController,
          cubit.priceController,
          cubit.notesController,
        ]),
      );

      // Create an invoice
      cubit.invoice.notes += '\n${cubit.notesController.text}';
      cubit.invoice.phoneNumber = phoneNumber;
      cubit.invoice.clientName = customerName;
      cubit.invoice.date = DateTime.now();

      cubit.invoice.price = totalPrice;
      cubit.invoice.discount =
          double.tryParse(cubit.discountController.text) ?? 0;

      if (selectedPart != null) {
        selectedPart!.quantity -= int.parse(cubit.quantityController.text);
      }

      cubit.invoice.parts.add(Part(
          cubit.partController.text,
          selectedPart?.code ?? '',
          int.parse(cubit.quantityController.text),
          selectedPart?.brand ?? '',
          double.parse(cubit.priceController.text),
          selectedPart?.wholesalePrice ?? 0,
          selectedPart?.lowStockThreshold ?? 99999));
      cubit.partController.text = '';
      cubit.quantityController.text = '';
      // cubit.discountController.text = '';
      cubit.notesController.text = '';
      cubit.priceController.text = '';
      selectedPart = null;
    }
  }
}
