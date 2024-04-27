import 'package:bab_el_ezz/features/auth/manager/login/login_cubit.dart';
import 'package:bab_el_ezz/features/auth/view/login_view.dart';
import 'package:bab_el_ezz/features/auth/view/register_view1.dart';
import 'package:bab_el_ezz/features/staff/view/staff_page.dart';
import 'package:bab_el_ezz/features/staff/widget/add_daily_item.dart';
import 'package:bab_el_ezz/features/store/widget/add_item_store.dart';
import 'package:bab_el_ezz/features/workshop/view/add_client.dart';
import 'package:bab_el_ezz/layout/view/layout.dart';
import 'package:bab_el_ezz/shared_utils/utils/widget/drop_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'features/auth/manager/register/register_cubit.dart';
import 'features/auth/view/register_view2.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'features/invoices/spare_invoices/view/spare_invoices.dart';
import 'features/invoices/maintenance_invoices/view/maintenance_invoices.dart';
import 'features/invoices/supplier_invoices/view/supplier_invoices.dart';
import 'features/invoices/maintenance_invoices/widget/add_maintenance_customer_data.dart';
import 'features/invoices/spare_invoices/widget/add_customer_spare_data.dart';
import 'features/invoices/supplier_invoices/widget/add_invoice_data.dart';
import 'features/invoices/spare_invoices/widget/add_invoice_spare_data.dart';
import 'features/invoices/maintenance_invoices/widget/add_maintenance_invoice_data.dart';
import 'features/new_job-order/view/new_job_order_page .dart';
import 'features/staff/view/account_clearance_page.dart';
import 'features/staff/widget/add_staff_item.dart';
import 'features/workshop/view/daily_expenses.dart';
import 'features/workshop/view/search_client.dart';
import 'features/workshop/view/spare_receipt.dart';
import 'features/workshop/widget/add_daily_expenses.dart';
import 'features/workshop/widget/work_shop_body.dart';


void main() {
 runApp(const MyApp());

}

initializeDateFormatting(String s, param1) {
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider<LoginCubit>( create: (context) => LoginCubit(),),

        BlocProvider<RegisterCubit>(create: (context) => RegisterCubit(),),
      ],
      child: MaterialApp(
        locale: const Locale('ar', ''), // Set locale to Arabic
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('ar', ''), // Arabic
        ],

        darkTheme: ThemeData.dark(),
        themeMode: ThemeMode.dark,
        debugShowCheckedModeBanner: false,

        title: 'Flutter Demo',
        theme: ThemeData(
          backgroundColor: Colors.black,
          useMaterial3: true,
          visualDensity: VisualDensity.adaptivePlatformDensity,

        ),
        home:    const Directionality(
          textDirection: TextDirection.rtl,
          child: LayOut(
          ),
        ),
        routes: {
          'login': (context) => const LoginView(),
          "register1":(context)=> const RegisterView1(),
          "register2":(context)=>const RegisterView2(),
          "staff":(context)=>const StaffPage(),
          "layout":(context)=>const LayOut(),
          "dailyExpenses": (context) => const DailyExpenses(),
          "workshop": (context) => const WorkShopBody(),
          "spareReceipt": (context) => const SpareReceipt(),
          "newJobOrderPage": (context) => const NewJobOrderPage(),
          "maintenanceInvoices": (context) => const MaintenanceInvoices(),
          "searchClient": (context) => const SearchClient(),
          'addClient': (context) => const AddClient(),
          "supplierInvoices": (context) => const SupplierInvoices(),
          "accountClearancePage": (context) => const AccountClearancePage(),
          "addInvoiceData": (context) => const AddInvoicesData(),
          "addMaintenanceCustomer": (context) => const AddMaintenanceCustomerData(),
          "addItemStore": (context) => const AddsItemsStore(),
          "addDailyItem": (context) => const AddDailyItem(),
          "addStaffItem": (context) => const AddStaffItem(),
          'addDailyExpenses': (context) => const AddDailyExpenses(),
          "spareInvoices": (context) => const SpareInvoices(),
          "addCustomerSpareData": (context) => const AddCustomerSpareData(),
          "addInvoiceSpareData": (context) => const AddInvoiceSpareData(),
          "addMaintenanceInvoiceData": (context) => const AddMaintenanceInvoiceData(),









        },
      ),
    );
  }
}

