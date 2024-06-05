import 'package:flutter/material.dart';

import '../../styles/colors.dart';
import '../../styles/text.dart';

class DropMenu extends StatelessWidget {
  const DropMenu(
      {super.key,
      required this.onTapDelete,
      required this.onTapEdit,
      //todo change to required after finishing remaining code
      this.index});
  final void Function(int)? onTapDelete;
  final Function(int)? onTapEdit;
  final int? index;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: const RotationTransition(
          turns: AlwaysStoppedAnimation(90 / 360),
          child: Icon(
            Icons.more_vert,
            color: ColorsAsset.kGreen,
            size: 20,
          )),
      offset: const Offset(0, 15),
      color: Colors.white,
      elevation: 2,
      padding: EdgeInsets.zero,
      itemBuilder: (context) => [
        PopupMenuItem(
          value: 1,
          onTap: () {
            onTapEdit!(index!);
          },
          child: Text(
            "تعديل",
            style: AppStyles.styleRegular16(context)
                .copyWith(color: ColorsAsset.kLightBrown),
          ),
        ),
        PopupMenuItem(
          value: 2,
          onTap: () {
            onTapDelete!(index!);
          },
          child: Text(
            "حذف",
            style: AppStyles.styleRegular16(context)
                .copyWith(color: ColorsAsset.kLightBrown),
          ),
        ),
      ],
    );
  }
}
