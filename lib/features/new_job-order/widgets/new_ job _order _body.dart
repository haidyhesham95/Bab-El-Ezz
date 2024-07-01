import 'package:bab_el_ezz/data/car.dart';
import 'package:bab_el_ezz/data/job_order.dart';
import 'package:bab_el_ezz/data/technician.dart';
import 'package:bab_el_ezz/features/new_job-order/manager/new_job/new_job_cubit.dart';
import 'package:bab_el_ezz/shared_utils/styles/colors.dart';
import 'package:bab_el_ezz/shared_utils/styles/text.dart';
import 'package:bab_el_ezz/shared_utils/utils/widget/pay_container.dart';
import 'package:bab_el_ezz/shared_utils/utils/widget/text_align.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

import '../../../data/part.dart';
import '../../../generated/assets.dart';
import '../../../shared_utils/utils/widget/button_widget.dart';
import '../../../shared_utils/utils/widget/text_field.dart';
import '../../invoices/spare_invoices/manager/spare_invoices/spare_invoices_cubit.dart';
import '../../invoices/spare_invoices/widget/add_invoice_spare_row_table.dart';
import '../../invoices/spare_invoices/widget/add_invoice_spare_table.dart';
import '../../workshop/work_shop/widget/add_button.dart';
import 'add_note_text.dart';
import 'car_data.dart';
import 'create_pdf.dart';
import 'details.dart';
import 'details_previous_maintenance_button.dart';
import 'drop_button.dart';

class NewJobOrderBody extends StatefulWidget {
  const NewJobOrderBody({super.key});

  @override
  _NewJobOrderBodyState createState() => _NewJobOrderBodyState();
}

class _NewJobOrderBodyState extends State<NewJobOrderBody> {
  late JobOrder? jobOrder;

  double totalPrice = 0;
  List<Technician> techs = [], selectedTechs = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // jobOrder = JobOrder.fromJson(
    //     ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>);
    // jobOrder ??= JobOrder.empty();
    final routeArgs = ModalRoute.of(context)?.settings.arguments;

    if (routeArgs == null) {
      return const Center(
        child: Text('No arguments were provided!'),
      );
    }

    jobOrder = JobOrder.fromJson(routeArgs as Map<String, dynamic>);
    jobOrder ??= JobOrder.empty();
    final size = MediaQuery.of(context).size;
    return Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: BlocProvider(
          create: (context) => NewJobCubit(),
          child: BlocBuilder<NewJobCubit, NewJobState>(
            builder: (context, state) {
              NewJobCubit cubit = NewJobCubit.get(context);
              cubit.kMController.text = jobOrder?.car?.mileage ?? '';

              if (state is NewJobInitial) {
                cubit.getTechnicians();
                return const Center(
                    child: CircularProgressIndicator(
                  color: ColorsAsset.kGreen,
                ));
              }

              if (state is GetData) {
                techs = state.data as List<Technician>;
              }

              return SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    Details(
                      enterDate: DateFormat('yy-MM-dd HH:mm')
                              .format(jobOrder?.startDate ?? DateTime.now()) ??
                          '',
                      outDate: jobOrder?.endDate != null
                          ? DateFormat('yy-MM-dd HH:mm')
                              .format(jobOrder!.endDate!)
                          : '',
                      clientName: jobOrder?.clientName ?? '',
                    ),
                    const SizedBox(height: 20),
                    CarData(jobOrder?.car ?? Car.empty()),
                    const SizedBox(height: 20),
                    TextFieldWidget(
                      label: "عدد الكيلومترات",
                      titleStyle: AppStyles.styleMedium16(context),
                      hintStyle: AppStyles.styleSemiBold14(context),
                      hintText: ' ادخال العدد',
                      onChanged: (value) {},
                      controller: cubit.kMController,
                      errorMessage: 'الرجاء ادخال العدد',
                    ),
                    const SizedBox(height: 20),
                    DropButton(
                      styleHint: AppStyles.styleSemiBold14(context),
                      hintText: 'نوع الصيانة',
                      value: cubit.selectedMaintenanceType,
                      onChanged: (String? value) {
                        cubit.setSelectedMaintenanceType(value);
                      },
                      items: const [
                        DropdownMenuItem(
                          value: 'صيانه اعطال',
                          child: Text('صيانه اعطال'),
                        ),
                        DropdownMenuItem(
                          value: 'صيانة دورية',
                          child: Text('صيانة دورية'),
                        ),
                        DropdownMenuItem(
                          value: 'مرتجع',
                          child: Text('مرتجع تكرار أعطال'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const DetailsPreviousMaintenanceButton(),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: DropButton(
                            styleHint: AppStyles.styleSemiBold14(context),
                            hintText: 'اضافة فني للسيارة',
                            value: cubit.selectedValue,
                            onChanged: (String? value) {
                              cubit.setSelectedClientValue(value);
                            },
                            items: List.generate(
                                techs.length,
                                (index) => DropdownMenuItem(
                                      value: techs[index].name,
                                      child: Text(techs[index].name),
                                    )),
                          ),
                        ),
                        const SizedBox(width: 10),
                        AddButton(
                          onPressed: () {
                            int index = techs.indexWhere((element) =>
                                element.name == cubit.selectedValue);
                            selectedTechs.add(techs[index]);
                            techs.removeAt(index);
                            cubit.selectedValue = null;

                            cubit.update();
                          },
                        )
                      ],
                    ),
                    ...List.generate(
                        selectedTechs.length,
                        (index) => ListTile(
                              title: Text(selectedTechs[index].name),
                              trailing: IconButton(
                                  onPressed: () {
                                    techs.add(selectedTechs[index]);
                                    selectedTechs.removeAt(index);
                                    cubit.update();
                                  },
                                  icon: const Icon(Icons.clear)),
                            )),
                    const SizedBox(height: 20),
                    Image.asset(
                      Assets.imagesCars,
                    ),
                    const SizedBox(height: 20),
                    addNoteText(context),
                    const SizedBox(height: 10),
                    textAlign(
                      context,
                      'اضافة تفاصيل الفاتورة  ',
                    ),
                    const SizedBox(height: 15),
                    BlocProvider(
                      create: (context) => SpareInvoicesCubit(),
                      child:
                          BlocBuilder<SpareInvoicesCubit, SpareInvoicesState>(
                        builder: (context, state) {
                          SpareInvoicesCubit cubit1 =
                              SpareInvoicesCubit.get(context);

                          if (state is SpareInvoicesInitial) {
                            //   _setupInitialData(cubit1);
                            WidgetsBinding.instance.addPostFrameCallback((_) {
                              _setupInitialData(cubit1);
                            });
                          } else if (state is SearchData) {
                            searchResults = state.data as List<Part>;
                          }

                          return Column(
                            children: [
                              if (searchResults.isNotEmpty)
                                ListView.builder(
                                  shrinkWrap: true,
                                  itemBuilder: (_, index) => ListTile(
                                    title: Text(searchResults[index].name),
                                    onTap: (searchResults[index].quantity > 0)
                                        ? () {
                                            selectedPart = searchResults[index];
                                            cubit1.partController.text =
                                                searchResults[index].name;
                                            cubit1.priceController.text =
                                                searchResults[index]
                                                    .sellingPrice
                                                    .toString();
                                            searchResults.clear();
                                            cubit1.update();
                                          }
                                        : () {
                                            Fluttertoast.showToast(
                                                msg: "لا يوجد مخزون");
                                          },
                                  ),
                                  itemCount: searchResults.length,
                                ),
                              AddInvoiceSpareTable(
                                rows: cubit1.items,
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                    textAlign(context, 'تحديد طريقة الدفع'),
                    const SizedBox(height: 15),
                    PayContainer(
                      title: "دفع كاش",
                      onTap: cubit.cashTapped,
                      isTapped: cubit.isTapped1,
                    ),
                    const SizedBox(height: 10),
                    PayContainer(
                      title: "دفع الكتروني ",
                      onTap: cubit.electronicTapped,
                      isTapped: cubit.isTapped2,
                    ),
                    const SizedBox(height: 50),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ButtonWidget(
                          hasElevation: true,
                          text: "حفظ مؤقت",
                          onPressed: () {},
                          width: size.width * 0.4,
                          height: size.height * 0.05,
                        ),
                        ButtonWidget(
                          hasElevation: true,
                          text: "انهاء امر الشغل",
                          onPressed: () {
                            print("Button pressed");
                            PdfGenerator.createPdf(jobOrder);
                          },
                          width: size.width * 0.4,
                          height: size.height * 0.05,
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              );
            },
          ),
        ));
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

  Part? selectedPart;
  List<Part> searchResults = [];

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
      cubit.invoice.phoneNumber = '';
      cubit.invoice.clientName = '';
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
