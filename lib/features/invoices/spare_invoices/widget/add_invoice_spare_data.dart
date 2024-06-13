import 'package:bab_el_ezz/data/customer.dart';
import 'package:bab_el_ezz/data/part.dart';
import 'package:bab_el_ezz/features/invoices/invoices/widget/top_invoice_search.dart';
import 'package:bab_el_ezz/shared_utils/utils/widget/const_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared_utils/styles/text.dart';
import '../../../../shared_utils/utils/widget/button_widget.dart';
import '../../../new_job-order/widgets/gray_container.dart';
import '../manager/spare_invoices/spare_invoices_cubit.dart';
import 'add_invoice_spare_row_table.dart';
import 'add_invoice_spare_table.dart';

class AddInvoiceSpareData extends StatelessWidget {
  AddInvoiceSpareData({super.key});

  List<Customer> customers = [];
  List<Part> searchResults = [];
  TextEditingController partController = TextEditingController();
  TextEditingController serviceController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController discountController = TextEditingController();
  TextEditingController notesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => SpareInvoicesCubit(),
      child: BlocConsumer<SpareInvoicesCubit, SpareInvoicesState>(
          listener: (context, state) {},
          builder: (context, state) {
            SpareInvoicesCubit cubit = SpareInvoicesCubit.get(context);

            if (state is SpareInvoicesInitial) {
              partController.addListener(() {
                cubit.searchPart(partController.text);
              });
              cubit.getCustomers();
              cubit.getParts();
              cubit.addItem(addInvoiceSpareRowTable([
                partController,
                quantityController,
                discountController,
                serviceController,
                notesController,
              ], onAddPressed: () {
                cubit.addItem(
                  addInvoiceSpareRowTable([
                    partController,
                    quantityController,
                    discountController,
                    serviceController,
                    notesController,
                  ]),
                );
                partController.text = '';
                quantityController.text = '';
                discountController.text = '';
                serviceController.text = '';
                notesController.text = '';
              }, footer: true));
              return SizedBox(
                  height: 50, width: 50, child: CircularProgressIndicator());
            }

            if (state is SearchData) {
              final data = state.data;
              if (data is List<Customer>) {
                customers = data;
              } else if (data is List<Part>) {
                searchResults = data;
              }
            }

            return Scaffold(
              appBar: constAppBar(
                context,
                ' اضافة فاتورة جديدة',
              ),
              body: SingleChildScrollView(
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: SizedBox(
                      height: size.height,
                      child: Form(
                        key: cubit.formKey1,
                        child: Column(
                          children: [
                            const SizedBox(height: 20),
                            GrayContainer(
                              height: cubit.isTableVisible
                                  ? size.height * 0.33
                                  : size.height * 0.22,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TopInvoicesSearch(
                                    controller: cubit.searchController,
                                    onPressedSearch: () {
                                      cubit.isTableVisible = false;
                                      cubit.update();
                                      cubit.searchCustomer();
                                    },
                                    hintText:
                                        "البحث عن عميل بالاسم أو رقم التليفون",
                                    showText: false,
                                  ),
                                  // TextFieldWidget(
                                  //   height: size.height * 0.06,
                                  //   controller: cubit.nameController,
                                  //   label: ' اسم العميل :',
                                  //   hintText: 'الاسم',
                                  //   hintStyle:
                                  //       AppStyles.styleRegular10(context),
                                  //   style: AppStyles.styleRegular10(context),
                                  //   borderRadius: 4,
                                  //   onChanged: (value) {},
                                  //   keyboardType: TextInputType.text,
                                  // ),
                                  // TextFieldWidget(
                                  //   height: size.height * 0.06,
                                  //   controller: cubit.phoneController,
                                  //   label: 'رقم التلفون :',
                                  //   hintText: 'الموجود عليه الواتساب',
                                  //   hintStyle:
                                  //       AppStyles.styleRegular10(context),
                                  //   style: AppStyles.styleRegular10(context),
                                  //   borderRadius: 4,
                                  //   onChanged: (value) {},
                                  //   keyboardType: TextInputType.number,
                                  // ),
                                  if (cubit.isTableVisible) ...[
                                    Text(
                                        "اسم العميل: ${cubit.customerNameController.text}"),
                                    Text(
                                        "رقم الهاتف: ${cubit.customerPhoneController.text}")
                                  ],
                                  ElevatedButton(
                                    onPressed: () async {
                                      Customer customer =
                                          await Navigator.pushNamed(context,
                                                  'AddCustomerInSpareInvoice')
                                              as Customer;
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
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            if (cubit.isTableVisible) ...[
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: AddInvoiceSpareTable(
                                  rows: cubit.items,
                                ),
                              ),
                              const SizedBox(height: 20),
                              Spacer(
                                flex: 3,
                              ),
                              ButtonWidget(
                                hasElevation: true,
                                height: size.height * 0.05,
                                text: ' إضافة  ',
                                onPressed: () {},
                              ),
                              Spacer(),
                              ...List.generate(searchResults.length, (index) {
                                return ListTile(
                                  title: Text(searchResults[index].name),
                                  onTap: () {
                                    partController.text =
                                        searchResults[index].name;

                                    // cubit.updateTableView(customers[0].name,
                                    //     customers[0].phoneNumber);
                                  },
                                );
                              })
                            ] else
                              ...List.generate(customers.length, (index) {
                                return ListTile(
                                  title: Text(customers[0].name),
                                  subtitle: Text(customers[0].phoneNumber),
                                  onTap: () {
                                    cubit.updateTableView(customers[0].name,
                                        customers[0].phoneNumber);
                                  },
                                );
                              })
                          ],
                        ),
                      ),
                    )),
              ),
            );
          }),
    );
  }
}
