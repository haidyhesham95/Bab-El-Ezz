import 'package:bab_el_ezz/shared_utils/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../shared_utils/styles/text.dart';
import 'manager/notification_cubit.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotificationCubit(),
      child: BlocConsumer<NotificationCubit, NotificationState>(
        listener: (context, state) {},
        builder: (context, state) {
          NotificationCubit cubit = NotificationCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text("التنبيهات",style: AppStyles.styleExtraBold15(context),),
            ),
            body: ListView.builder(
              itemCount: cubit.notifications.length,
              itemBuilder: (context, index) {
                return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: ColorsAsset.kGreen,
                          width: 2.0,
                        ),
                      ),
                      child: ListTile(
                        tileColor: Colors.white,
                        leading: const Icon(
                          Icons.notifications_active_outlined,
                          color: Colors.red,
                        ),
                        title: Text(
                          cubit.notifications[index].content,
                          style: AppStyles.styleLight16black(context),
                        ),
                        trailing: Text(
                          cubit.notifications[index].date,
                          style: AppStyles.styleLight14grey(context),
                        ),
                      ),
                    ));
              },
            ),
          );
        },
      ),
    );
  }
}
