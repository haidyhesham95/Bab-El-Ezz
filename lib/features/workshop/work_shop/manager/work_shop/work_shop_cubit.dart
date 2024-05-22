import 'package:bab_el_ezz/data/job_order.dart';
import 'package:bab_el_ezz/firebase/firebase_collection.dart';
import 'package:bab_el_ezz/firebase/user_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'work_shop_state.dart';

class WorkShopCubit extends Cubit<WorkShopState> {
  WorkShopCubit() : super(WorkShopInitial());
  String uid = UserServices.getUserId()!;
  final carRef = FirebaseCollection().carCol;
  final jobsRef = FirebaseCollection().jobOrderCol;

  static WorkShopCubit get(context) => BlocProvider.of(context);

  bool showAll = false;

  void toggleShowAll() {
    showAll = !showAll;
    emit(ShowAllLoaded(showAll: showAll));
  }

  getCurrentJobs() async {
    QuerySnapshot snapshot = await jobsRef.get();
    final List<JobOrder> data = snapshot.docs.map((e) {
      return e.data()! as JobOrder;
    }).toList();
    emit(GetData(data: data));
  }
}
