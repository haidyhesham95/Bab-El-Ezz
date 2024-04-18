import 'package:bab_el_ezz/features/auth/manager/login/login_cubit.dart';
import 'package:bab_el_ezz/features/auth/view/login_view.dart';
import 'package:bab_el_ezz/features/auth/view/register_view1.dart';
import 'package:bab_el_ezz/features/staff/view/staff_page.dart';
import 'package:bab_el_ezz/features/workshop/view/add_client.dart';
import 'package:bab_el_ezz/layout/view/layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'features/auth/manager/register/register_cubit.dart';
import 'features/auth/view/register_view2.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'features/invoices/view/customer_invoice.dart';
import 'features/invoices/view/supplier_invoices.dart';
import 'features/new_job-order/view/new_job_order_page .dart';
import 'features/staff/view/account_clearance_page.dart';
import 'features/workshop/view/daily_expenses.dart';
import 'features/workshop/view/search_client.dart';
import 'features/workshop/view/spare_receipt.dart';
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
          "CustomerInvoice": (context) => const CustomerInvoice(),
          "searchClient": (context) => const SearchClient(),
          'addClient': (context) => const AddClient(),
          "supplierInvoices": (context) => const SupplierInvoices(),
          "accountClearancePage": (context) => const AccountClearancePage(),



        },
      ),
    );
  }
}

