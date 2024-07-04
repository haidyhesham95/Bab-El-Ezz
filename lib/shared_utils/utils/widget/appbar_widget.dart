import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../features/notification/notification_page.dart';
import '../../../features/setting/view/drop_menu.dart';
import '../../../generated/assets.dart';
import '../../styles/text.dart';

AppBar appBarWidget(BuildContext context) {
  return AppBar(
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context) =>const NotificationPage() ,));
          },
          child: Row(
            children: [
              SvgPicture.asset(
                Assets.imagesNotification,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                "التنبيهات",
                style: AppStyles.styleExtraBold13(context),
              ),
            ],
          ),
        ),
        const DropMenuWidget()



      ],
    ),
  );
}
