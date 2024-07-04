import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../generated/assets.dart';
import '../../../../../shared_utils/styles/colors.dart';

class FinancialCards extends StatelessWidget {
  const FinancialCards({super.key});

  @override
  Widget build(BuildContext context) {

   final size = MediaQuery.of(context).size;
    return Row(
      children: [
        Flexible(
          child: _buildCard(
            height: size.height * 0.08,

            iconPath: Assets.imagesProfit,
            iconColor: Colors.white,
            iconSize: 35,
            backgroundColor: Colors.red.shade400,
            color: Colors.red,
            text1: 'الربح',
            text2: '%72',
          ),
        ),
        Flexible(
          child: _buildCard(
            height: size.height * 0.08,


            iconPath: Assets.imagesPrice,
            iconColor: Colors.white,
            iconSize: 28,
            backgroundColor:  ColorsAsset.kGreen.withOpacity(0.9),
            color: ColorsAsset.kGreen,

            text1: 'سعر الجملة',
            text2: '%72',
          ),
        ),
        Flexible(
          child: _buildCard(
            height: size.height * 0.08,


            iconPath: Assets.imagesValue1,
            iconColor: Colors.white,
            iconSize: 28,
            backgroundColor: Colors.blue.shade400,
            color: Colors.blue,
            text1: 'اجمالي القيمة  ',
            text2: '%72',
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

    required double height,
    required Color color,

  }) {
    return SizedBox(
      height: height,
      child: Card(
        color: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Container(
              height: height,
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
                  Text(text1, style: const TextStyle(fontSize: 15,color: Colors.white), overflow: TextOverflow.visible),
                  Text(text2, style:  const TextStyle(fontSize: 15,color: Colors.white), overflow: TextOverflow.visible),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
