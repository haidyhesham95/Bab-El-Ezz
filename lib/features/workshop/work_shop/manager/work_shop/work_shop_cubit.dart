import 'package:bab_el_ezz/data/job_order.dart';
import 'package:bab_el_ezz/data/workshop.dart';
import 'package:bab_el_ezz/firebase/firebase_collection.dart';
import 'package:bab_el_ezz/firebase/user_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'work_shop_state.dart';

class WorkShopCubit extends Cubit<WorkShopState> {
  WorkShopCubit() : super(WorkShopInitial());
  String uid = UserServices.getUserId()!;
  final jobsRef = FirebaseCollection().jobOrderCol;
  final workshopRef = FirebaseCollection().workshopCol;
  List<JobOrder> jobOrders = [];
  Workshop? workshop;

  static WorkShopCubit get(context) => BlocProvider.of(context);

  bool showAll = false;

  void toggleShowAll() {
    showAll = !showAll;
    emit(ShowAllLoaded(showAll: showAll));
  }

  getCurrentJobs() async {
    QuerySnapshot snapshot = await jobsRef.get();
    jobOrders = snapshot.docs
        .where((e) => (e.data() as JobOrder).finished != true)
        .map((e) {
      return e.data()! as JobOrder;
    }).toList();
    snapshot = await workshopRef.get();
    workshop = snapshot.docs.where((e) => e.id == "profile").firstOrNull?.data()
        as Workshop?;
    emit(GetData(data: jobOrders));
  }

  void updateOrder(JobOrder? oldOrder, JobOrder? newOrder) {
    if (newOrder == null || oldOrder == null) return;

    int index = jobOrders.indexOf(oldOrder);
    jobOrders.removeAt(index);
    if (!newOrder.finished) {
      jobOrders.insert(index, newOrder);
    }

    emit(GetData(data: jobOrders));
  }
}
