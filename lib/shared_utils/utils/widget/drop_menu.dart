
import 'package:flutter/material.dart';

import '../../styles/colors.dart';
import '../../styles/text.dart';

class DropMenu extends StatelessWidget {
  const DropMenu({super.key, required this.onTapDelete,required this.onTapEdit});
  final void Function()? onTapDelete;
  final void Function()? onTapEdit;
  @override
  Widget build(BuildContext context) {
    return  PopupMenuButton(
      icon: RotationTransition(
          turns: const AlwaysStoppedAnimation(90 / 360),
          child: const Icon(Icons.more_vert,color:  ColorsAsset.kGreen,size: 20,)),
      offset: const Offset(0, 15),
      color: Colors.white,
      elevation: 2,
      padding: EdgeInsets.zero,

      itemBuilder: (context) => [
        PopupMenuItem(
          value: 1,
          onTap: onTapEdit,
          child:  Text("تعديل",style:  AppStyles.styleRegular16(context)
              .copyWith(color: ColorsAsset.kLightBrown),),
        ),
        PopupMenuItem(
          value: 2,
          onTap: onTapDelete,
          child:  Text("حذف",style:  AppStyles.styleRegular16(context)
              .copyWith(color: ColorsAsset.kLightBrown),),
        ),
      ],
    );
  }
}


