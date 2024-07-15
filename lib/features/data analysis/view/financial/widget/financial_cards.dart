import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../generated/assets.dart';
import '../../../../../shared_utils/styles/colors.dart';

class FinancialCards extends StatelessWidget {
  const FinancialCards(this.net, this.store, this.remaining, {super.key});

  final double net, store, remaining;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      children: [
        Flexible(
          child: _buildCard(
            size: size,
            iconPath: Assets.imagesProfit,
            iconColor: Colors.white,
            iconSize: 35,
            backgroundColor: ColorsAsset.kGreen.withOpacity(0.9),
            color: ColorsAsset.kGreen,
            text1: 'صافي الربح',
            text2: net.toString(),
          ),
        ),
        Flexible(
          child: _buildCard(
            size: size,
            iconPath: Assets.imagesPrice,
            iconColor: Colors.white,
            iconSize: 28,
            backgroundColor: const Color(0xffF1BA1A).withOpacity(0.8),
            color: const Color(0xffF1BA1A),
            text1: 'رصيد المخزن',
            text2: store.toString(),
          ),
        ),
        Flexible(
          child: _buildCard(
            size: size,
            iconPath: Assets.imagesValue1,
            iconColor: Colors.white,
            iconSize: 28,
            backgroundColor: Colors.blue.shade400,
            color: Colors.blue,
            text1: 'اجمالي الاجل ',
            text2: remaining.toString(),
          ),
        ),
      ],
    );
  }

  Widget _buildCard({
    required String iconPath,
    required Color iconColor,
    required double iconSize,
    required Color backgroundColor,
    required String text1,
    required String text2,
    required Size size,
    required Color color,
  }) {
    return SizedBox(
      height: size.height * 0.09,
      child: Card(
        color: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Container(
              height: size.height * 0.08,
              width: size.width * 0.09,
              padding: const EdgeInsets.only(right: 5, left: 5),
              decoration: BoxDecoration(
                color: color,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: SvgPicture.asset(
                iconPath,
                color: iconColor,
                width: iconSize,
                height: iconSize,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(text1,
                      style: const TextStyle(fontSize: 13, color: Colors.white),
                      overflow: TextOverflow.visible),
                  Text(text2,
                      style: const TextStyle(fontSize: 13, color: Colors.white),
                      overflow: TextOverflow.visible),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
