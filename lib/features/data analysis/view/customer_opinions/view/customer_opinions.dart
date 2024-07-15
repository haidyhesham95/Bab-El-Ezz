import 'package:bab_el_ezz/features/data%20analysis/view/customer_opinions/manager/customer_cubit.dart';
import 'package:bab_el_ezz/features/data%20analysis/view/customer_opinions/widget/customer_cards.dart';
import 'package:bab_el_ezz/features/data%20analysis/view/technical/widget/technical_date.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../widget/questions_chart.dart';

class CustomerOpinions extends StatelessWidget {
  const CustomerOpinions({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> questions = [
      "ما مدي رضاءك عن مدة الانتظار ؟",
      "ما تقييمك لحسن الاستقبال ؟",
      "ما مدي رضاءك عن جودة الخدمة المقدمة ؟",
      "ما تقييمك لسعر الخدمة ؟",
      "هل تم انجازالعمل المطلوب من أول مرة ؟",
      "هل ستقوم بترشيحنا لعملاء أخرين ؟"
    ];
    return BlocProvider(
      create: (context) => CustomerCubit(),
      child: BlocBuilder<CustomerCubit, CustomerState>(
        builder: (context, state) {
          CustomerCubit cubit = CustomerCubit.get(context);

          if (state is CustomerInitial) {
            cubit.getData();
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return Scaffold(
              body: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  TechnicalDate(
                    text: cubit.selectedRange == null
                        ? ' اختر التاريخ من - إلى '
                        : ' من : ${DateFormat('yyyy-MM-dd').format(cubit.selectedRange!.start)}  -  الي : ${DateFormat('yyyy-MM-dd').format(cubit.selectedRange!.end)} ',
                    onTap: () {
                      cubit.getDateRange(context);
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomerCards(cubit.jobOrders, cubit.feedbacks),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    height: 500,
                    width: double.infinity,
                    child: ListView.builder(
                      itemCount: 6,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.topRight,
                                child: Text(
                                  questions[index],
                                  style: const TextStyle(fontSize: 20),
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 80.0),
                                child: QuestionsChart(),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ));
        },
      ),
    );
  }
}
