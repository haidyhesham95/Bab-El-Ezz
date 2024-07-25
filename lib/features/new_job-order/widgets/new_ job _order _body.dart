import 'package:bab_el_ezz/data/car.dart';
import 'package:bab_el_ezz/data/job_order.dart';
import 'package:bab_el_ezz/data/spare_invoice.dart';
import 'package:bab_el_ezz/data/technician.dart';
import 'package:bab_el_ezz/features/new_job-order/manager/new_job/new_job_cubit.dart';
import 'package:bab_el_ezz/features/new_job-order/widgets/previous_maintenance_miantenance_type.dart';
import 'package:bab_el_ezz/shared_utils/styles/colors.dart';
import 'package:bab_el_ezz/shared_utils/styles/text.dart';
import 'package:bab_el_ezz/shared_utils/utils/constant.dart';
import 'package:bab_el_ezz/shared_utils/utils/widget/pay_container.dart';
import 'package:bab_el_ezz/shared_utils/utils/widget/text_align.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

import '../../../data/part.dart';
import '../../../shared_utils/utils/widget/button_widget.dart';
import '../../../shared_utils/utils/widget/text_field.dart';
import '../../invoices/spare_invoices/manager/spare_invoices/spare_invoices_cubit.dart';
import '../../invoices/spare_invoices/widget/add_invoice_spare_row_table.dart';
import '../../invoices/spare_invoices/widget/add_invoice_spare_table.dart';
import '../../workshop/work_shop/widget/add_button.dart';
import 'car_data.dart';
import 'details.dart';
import 'drop_button.dart';
import 'marker.dart';

class NewJobOrderBody extends StatefulWidget {
  const NewJobOrderBody({super.key});

  @override
  _NewJobOrderBodyState createState() => _NewJobOrderBodyState();
}

class _NewJobOrderBodyState extends State<NewJobOrderBody> {
  JobOrder? jobOrder;

  double totalPrice = 0;
  List<Technician> techs = [];
  bool pastOrder = false;

  GlobalKey paintKey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)?.settings.arguments;
    if (data != null) {
      if (data is List) {
        jobOrder = data[0] as JobOrder;
        pastOrder = data[1] as bool;
      } else {
        jobOrder = data as JobOrder;
      }
    }

    if (jobOrder == null) {
      return const Center(
        child: Text('No arguments were provided!'),
      );
    }

    print("order: ${jobOrder?.id}");
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

              if (state is NewJobInitial) {
                cubit.getTechnicians();
                cubit.getPastOrders(jobOrder?.car?.licensePlate ?? '');
                cubit.kMController.text = jobOrder?.car?.mileage ?? '';
                cubit.selectedMaintenanceType = jobOrder?.maintenanceType;

                if (jobOrder?.paymentType == "visa") {
                  cubit.electronicTapped();
                } else if (jobOrder?.paymentType == "cash") {
                  cubit.cashTapped();
                }
                return const Center(
                    child: CircularProgressIndicator(
                  color: ColorsAsset.kGreen,
                ));
              }

              if (state is GetData) {
                techs = state.data as List<Technician>;
                cubit.selectedTechs.clear();
                print("techs: ${jobOrder?.technicians?.map((e) => e.name)}");
                jobOrder?.technicians?.forEach((tech) {
                  cubit.selectedTechs.add(tech);
                  techs.removeWhere((e) => tech.name == e.name);
                });
                cubit.notesController.text = jobOrder?.notes ?? '';
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
                      items: [
                        DropdownMenuItem(
                          value: MAIN_TYPE_FAULT,
                          child: const Text(MAIN_TYPE_FAULT),
                          onTap: () {
                            cubit.changeReturnVisiblity(false);
                          },
                        ),
                        DropdownMenuItem(
                          value: MAIN_TYPE_PERIODIC,
                          child: const Text(MAIN_TYPE_PERIODIC),
                          onTap: () {
                            cubit.changeReturnVisiblity(false);
                          },
                        ),
                        DropdownMenuItem(
                          value: 'مرتجع',
                          child: const Text('مرتجع تكرار أعطال'),
                          onTap: () {
                            cubit.changeReturnVisiblity(true);
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Visibility(
                      visible: cubit.returnVisible,
                      child: TextButton(
                        child: const Text("اختر الصيانة السابقة للمرتجع"),
                        onPressed: () async {
                          JobOrder order = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PreviousMaintenanceType(
                                  chooseItem: true,
                                  pastOrders: cubit.pastOrders,
                                ),
                              ));
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PreviousMaintenanceType(
                                pastOrders: cubit.pastOrders,
                              ),
                            ));
                      },
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            textAlign(
                              context,
                              'تفاصيل الصيانات السابقة',
                              style: AppStyles.styleMedium16(context)
                                  .copyWith(color: ColorsAsset.kGreen),
                            ),
                            const Icon(
                              Icons.arrow_forward_ios_outlined,
                              color: ColorsAsset.kGreen,
                            )
                          ]),
                    ),
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
                            cubit.selectedTechs.add(techs[index]);
                            techs.removeWhere(
                                (e) => techs[index].name == e.name);
                            cubit.selectedValue = null;

                            cubit.update();
                          },
                        )
                      ],
                    ),
                    ...List.generate(
                        cubit.selectedTechs.length,
                        (index) => ListTile(
                              title: Text(cubit.selectedTechs[index].name),
                              trailing: IconButton(
                                  onPressed: () {
                                    techs.add(cubit.selectedTechs[index]);
                                    cubit.selectedTechs.removeAt(index);
                                    cubit.update();
                                  },
                                  icon: const Icon(Icons.clear)),
                            )),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: size.height * 0.5,
                      width: size.width * 0.9,
                      child: InteractiveImagePainter(
                        globalKey: paintKey,
                        backgroundImage: jobOrder?.carImage,
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFieldWidget(
                      label: " اضافة ملاحظات ",
                      titleStyle: AppStyles.styleMedium16(context),
                      hintStyle: AppStyles.styleSemiBold14(context),
                      hintText: "ملاحظات..",
                      maxLines: 3,
                      controller: cubit.notesController,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.text,
                    ),
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
                            _setupInitialData(cubit1);
                            if (jobOrder != null && jobOrder!.invoice != null) {
                              List<Part>? parts = List.from(
                                  jobOrder?.invoice?.parts as Iterable);
                              for (var part in parts) {
                                cubit1.partController.text = part.name;
                                cubit1.quantityController.text =
                                    part.quantity.toString();
                                cubit1.priceController.text =
                                    part.sellingPrice.toString();
                                onAddPressed(cubit1);
                              }
                            }
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
                          onPressed: () {
                            cubit
                                .saveOrder(
                                    jobOrder!, false, paintKey, pastOrder)
                                .then((order) => Navigator.of(context)
                                    .pushReplacementNamed("layout",
                                        result: order));
                          },
                          width: size.width * 0.4,
                          height: size.height * 0.05,
                        ),
                        ButtonWidget(
                          hasElevation: true,
                          text: "انهاء امر الشغل",
                          onPressed: () {
                            print("Button pressed");
                            cubit
                                .saveOrder(jobOrder!, true, paintKey, pastOrder)
                                .then((order) => Navigator.of(context)
                                    .pushReplacementNamed("layout",
                                        result: order));
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
      // cubit.totalController.text =
      //     ((double.tryParse(cubit.totalController.text) ?? 0) -
      //             (double.tryParse(cubit.discountController.text) ?? 0))
      //         .toString();
      // // totalPrice = double.tryParse(cubit.totalController.text) ?? 0;
      // cubit.updateTotalPrice(addInvoiceSpareRowTable(
      //   [
      //     cubit.partController,
      //     cubit.quantityController,
      //     cubit.totalController,
      //     cubit.notesController,
      //   ],
      //   total: true,
      // ));
    });

    cubit.serviceController.addListener(() {
      // cubit.totalController.text =
      //     ((double.tryParse(cubit.totalController.text) ?? 0) +
      //             (double.tryParse(cubit.serviceController.text) ?? 0))
      //         .toString();
      // // totalPrice = double.tryParse(cubit.totalController.text) ?? 0;
      // cubit.updateTotalPrice(addInvoiceSpareRowTable(
      //   [
      //     cubit.partController,
      //     cubit.quantityController,
      //     cubit.totalController,
      //     cubit.notesController,
      //   ],
      //   total: true,
      // ));
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

    cubit.addItem(
      addInvoiceSpareRowTable([
        cubit.partController,
        cubit.quantityController,
        cubit.discountController,
        cubit.notesController,
      ], discount: true, onEditDone: () {
        cubit.totalController.text =
            ((double.tryParse(cubit.totalController.text) ?? 0) -
                    (double.tryParse(cubit.discountController.text) ?? 0))
                .toString();
        // totalPrice = double.tryParse(cubit.totalController.text) ?? 0;
        cubit.updateTotalPrice(addInvoiceSpareRowTable(
          [
            cubit.partController,
            cubit.quantityController,
            cubit.totalController,
            cubit.notesController,
          ],
          total: true,
        ));
      }),
    );

    cubit.addItem(addInvoiceSpareRowTable([
      cubit.partController,
      cubit.quantityController,
      cubit.serviceController,
      cubit.notesController,
    ], service: true, onEditDone: () {
      print("service: ${cubit.serviceController.text}");
      cubit.totalController.text =
          ((double.tryParse(cubit.totalController.text) ?? 0) +
                  (double.tryParse(cubit.serviceController.text) ?? 0))
              .toString();
      // totalPrice = double.tryParse(cubit.totalController.text) ?? 0;
      cubit.updateTotalPrice(addInvoiceSpareRowTable(
        [
          cubit.partController,
          cubit.quantityController,
          cubit.totalController,
          cubit.notesController,
        ],
        total: true,
      ));
    }));

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

  //fixme: add must be pressed to add invoice..
  void onAddPressed(SpareInvoicesCubit cubit) {
    jobOrder?.invoice ??= SpareInvoice.empty();

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
      jobOrder?.invoice?.notes += '\n${cubit.notesController.text}';
      jobOrder?.invoice?.phoneNumber = '';
      jobOrder?.invoice?.clientName = '';
      jobOrder?.invoice?.date = DateTime.now();

      print("service2: ${cubit.serviceController.text}");
      jobOrder?.invoice?.price = totalPrice;
      jobOrder?.invoice?.service =
          double.tryParse(cubit.serviceController.text) ?? 0;
      jobOrder?.invoice?.discount =
          double.tryParse(cubit.discountController.text) ?? 0;

      if (selectedPart != null) {
        selectedPart!.quantity -= int.parse(cubit.quantityController.text);
      }

      jobOrder?.invoice?.parts.add(Part(
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
