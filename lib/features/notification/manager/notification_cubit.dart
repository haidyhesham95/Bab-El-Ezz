import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

part 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit() : super(NotificationInitial());
  static NotificationCubit get(context) => BlocProvider.of(context);
  List<NotificationItem> notifications = [
    NotificationItem(
        content: "باقي يومان لدفع باقي مستحقات الفاتورة للمورد (اسم المورد) بقيمة (القيمة)",
        date: DateFormat('MMM d, yyyy').format(DateTime.now())),
    NotificationItem(
        content: "اليوم ميعاد دفع الفاتورة للمورد (اسم المورد ) بقيمة (القيمة)", date: DateFormat('MMM d, yyyy').format(DateTime.now())),
    NotificationItem(
        content: "لقد اقترب موعد نفاذ المخزون من قطعة الغيار (اسم القطعة )",
        date: DateFormat('MMM d, yyyy').format(DateTime.now())),
    NotificationItem(
        content: "لقد تم نفاذ المخزون من قطعة الغيار (اسم القطعة)",
        date: DateFormat('MMM d, yyyy').format(DateTime.now())),
  ];
}
class NotificationItem {
  final String content;
  final String date;

  const NotificationItem({
    required this.content,
    required this.date,
  });
}