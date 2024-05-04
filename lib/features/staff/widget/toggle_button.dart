import 'package:bab_el_ezz/shared_utils/styles/colors.dart';
import 'package:bab_el_ezz/shared_utils/styles/text.dart';
import 'package:flutter/material.dart';

class ToggleButton extends StatelessWidget {
  const ToggleButton({super.key, required this.selectedIndex, required this.onPressed,});
  final int selectedIndex;
  final Function(int) onPressed;

  @override
  Widget build(BuildContext context) {
    return   Container(
      width: 328,
      height: 45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () => onPressed(0),

            child: Container(
              width: 160,
              height: 36,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: selectedIndex == 0
                    ? ColorsAsset.kGreen
                    : Colors.white,
              ),
              child: Center(
                child: Text(
                  'الجدول اليومي',
                  style: AppStyles.styleRegular14(context).copyWith(
                    color:  selectedIndex == 0
                        ? Colors.white
                        : ColorsAsset.kLightBrown,),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () => onPressed(1),

            child: Container(
              width: 160,
              height: 36,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: selectedIndex == 1
                    ? ColorsAsset.kGreen
                    : Colors.white,
              ),
              child: Center(
                child: Text(
                  'جدول العمال',
                  style: AppStyles.styleRegular14(context).copyWith(
                    color:  selectedIndex == 1
                        ? Colors.white
                        : ColorsAsset.kLightBrown,),
                ),
              ),
            ),
          ),
        ],
      ),
    );

  }
}
