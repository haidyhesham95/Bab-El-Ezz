import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../shared_utils/styles/text.dart';
import 'custom_divider.dart';
import '../../../shared_utils/utils/widget/row_text.dart';
import 'gray_container.dart';

class Details extends StatelessWidget {
  const Details({super.key});

  @override
  Widget build(BuildContext context) {
    return GrayContainer(
      padding: const EdgeInsets.only(right: 12),
      height: 75,
      child:Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children:  [
          Row(
            children: [
              const Icon(Icons.watch_later_outlined),
              Padding(
                padding: const EdgeInsets.only(right: 10, left: 20),
                child: Text('وقت دخول السياره',style: AppStyles.styleSemiBold16(context),),
              ),
              const CustomDivider(),
              const SizedBox(width: 10,),
              Text('وقت خروج السياره',style: AppStyles.styleSemiBold16(context),),
            ],
          ),
          Row(
            children: [
              const Icon(CupertinoIcons.person),
              const SizedBox(width: 10,),
              RowText('اسم العميل : ',"هايدي",
               ),
            ],
          ),
        ],
      ),
    );
  }
}
