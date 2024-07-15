import 'package:bab_el_ezz/data/feedback.dart';
import 'package:bab_el_ezz/data/job_order.dart';
import 'package:flutter/material.dart';

import '../../../../../shared_utils/styles/colors.dart';

class CustomerCards extends StatelessWidget {
  CustomerCards(this.jobOrders, this.reviews, {super.key});
  List<JobOrder> jobOrders;
  List<Review> reviews;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Flexible(
          child: _buildCard(
            height: size.height * 0.08,
            width: size.width * 0.40,
            backgroundColor: ColorsAsset.kGreen.withOpacity(0.9),
            text: 'عدد أوامر العمل',
            value: jobOrders.length.toString(),
          ),
        ),
        Flexible(
          child: _buildCard(
            width: size.width * 0.40,
            height: size.height * 0.08,
            backgroundColor: Colors.blue.shade400,
            text: 'عدد الاستبيانات',
            value: reviews.length.toString(),
          ),
        ),
      ],
    );
  }

  Widget _buildCard({
    required Color backgroundColor,
    required String text,
    required String value,
    required double height,
    required double width,
  }) {
    return Container(
      height: height,
      width: width,
      padding: const EdgeInsets.only(right: 8, left: 8),
      decoration: BoxDecoration(
        color: backgroundColor,
        boxShadow: const [
          BoxShadow(
            blurRadius: 2,
            offset: Offset(0, 4),
          ),
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(text,
              style: const TextStyle(fontSize: 15, color: Colors.white),
              overflow: TextOverflow.visible),
          Text(value,
              style: const TextStyle(fontSize: 15, color: Colors.white),
              overflow: TextOverflow.visible),
        ],
      ),
    );
  }
}
