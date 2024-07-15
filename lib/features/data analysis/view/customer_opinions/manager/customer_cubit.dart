import 'package:bab_el_ezz/data/feedback.dart';
import 'package:bab_el_ezz/data/job_order.dart';
import 'package:bab_el_ezz/features/data%20analysis/view/financial/widget/picker.dart';
import 'package:bab_el_ezz/firebase/firebase_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'customer_state.dart';

class CustomerCubit extends Cubit<CustomerState> {
  CustomerCubit() : super(CustomerInitial());

  static CustomerCubit get(BuildContext context) => BlocProvider.of(context);

  DateTimeRange? selectedRange;
  List<JobOrder> jobOrders = [];
  List<Review> feedbacks = [];

  CollectionReference ordersRef = FirebaseCollection().jobOrderCol;
  CollectionReference feedbacksRef = FirebaseCollection().feedbackCol;

  getData() async {
    final data = await ordersRef.get();
    final feedbackData = await feedbacksRef.get();

    data.docs.where((e) {
      JobOrder jobOrder = e.data() as JobOrder;

      bool isWithinRange = (jobOrder.endDate?.isBefore((selectedRange?.end ??
                  jobOrder.endDate!.add(const Duration(seconds: 2)))) ??
              false) &&
          (jobOrder.endDate?.isAfter(selectedRange?.start ??
                  jobOrder.endDate!.subtract(const Duration(seconds: 2))) ??
              false);

      return isWithinRange;
    }).forEach((e) {
      JobOrder order = e.data() as JobOrder;
      jobOrders.add(order);
    });

    feedbackData.docs.where((e) {
      Review review = e.data() as Review;

      bool isWithinRange = (review.time.isBefore((selectedRange?.end ??
              review.time.add(const Duration(seconds: 2))))) &&
          (review.time.isAfter(selectedRange?.start ??
              review.time.subtract(const Duration(seconds: 2))));

      return isWithinRange;
    }).forEach((e) {
      Review review = e.data() as Review;
      feedbacks.add(review);
    });

    emit(UpdateData());
  }

  void getDateRange(BuildContext context) async {
    DateTimeRange? range =
        await AppFunctions.showPickerRange(context, selectedRange);
    if (range != null) {
      selectedRange = range;
      emit(GetRangeDate());
    }
  }
}
