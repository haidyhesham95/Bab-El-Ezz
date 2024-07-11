import 'package:flutter/material.dart';

import '../../../../../shared_utils/styles/colors.dart';

class TechnicalCards extends StatelessWidget {
  TechnicalCards(
      {super.key,
      required this.currentClients,
      required this.newClients,
      required this.orders});

  int currentClients, newClients, orders;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Flexible(
          child: _buildCard(
            height: size.height * 0.08,
            backgroundColor: Colors.red.shade400,
            text: 'العملاء الحاليين',
            value: currentClients.toString(),
          ),
        ),
        Flexible(
          child: _buildCard(
            height: size.height * 0.08,
            backgroundColor: ColorsAsset.kGreen.withOpacity(0.9),
            text: 'عدد العملاء الجدد',
            value: newClients.toString(),
          ),
        ),
        Flexible(
          child: _buildCard(
            height: size.height * 0.08,
            backgroundColor: Colors.blue.shade400,
            text: 'عدد أوامر الشغل ',
            value: orders.toString(),
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
  }) {
    return SizedBox(
      height: height,
      child: Container(
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
      ),
    );
  }
}
