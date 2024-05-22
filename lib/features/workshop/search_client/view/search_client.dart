import 'package:bab_el_ezz/data/job_order.dart';
import 'package:bab_el_ezz/features/workshop/search_client/manager/search_client_cubit.dart';
import 'package:bab_el_ezz/features/workshop/work_shop/widget/car_item.dart';
import 'package:bab_el_ezz/shared_utils/styles/text.dart';
import 'package:bab_el_ezz/shared_utils/utils/widget/button_widget.dart';
import 'package:bab_el_ezz/shared_utils/utils/widget/const_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared_utils/utils/widget/clip_path_gradient.dart';
import '../../../../shared_utils/utils/widget/container_search.dart';

class SearchClient extends StatelessWidget {
  SearchClient({super.key});

  final TextEditingController controller = TextEditingController();
  List<JobOrder> jobOrders = [];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchClientCubit(),
      child: BlocConsumer<SearchClientCubit, SearchClientState>(
          builder: (context, state) {
            SearchClientCubit cubit = SearchClientCubit.get(context);
            if (state is SearchClientInitial) {
              cubit.getJobOrders();
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is GetData) {
              print("result: ${state.jobOrders}");
              jobOrders = state.jobOrders;
            }
            return Scaffold(
              appBar: constAppBar(context, 'بحث عن العميل'),
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 40),
                  clipBathGradient(
                    context,
                    text: 'البحث عن عميل',
                  ),
                  const SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        Flexible(
                          child: ContainerSearch(
                            controller: controller,
                            radius: 0,
                            hintText: 'بحث',
                            onPressed: () {
                              String query = controller.text;
                              print("query: $query");
                              cubit.searchJobOrders(query);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  //todo add listview to show as search results and
                  //todo add new client at the bottom
                  Expanded(
                    child: GridView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        itemCount: jobOrders.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 25,
                          mainAxisExtent: 100,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return carItem(context, jobOrders[index]);
                        }),
                  ),
                  Center(
                    child: ButtonWidget(
                      borderRadius: 4,
                      // width: 90,
                      text: 'اضافة عميل جديد',
                      margin: const EdgeInsets.all(20),
                      onPressed: () async {
                        await Navigator.pushNamed(context, 'addClient');
                        //todo emit new data when refactor to home page
                      },
                      fontStyle: AppStyles.styleRegular14(context),
                    ),
                  ),
                ],
              ),
            );
          },
          listener: (context, state) {}),
    );
  }
}
