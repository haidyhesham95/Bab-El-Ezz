import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../shared_utils/styles/text.dart';
import '../../../shared_utils/utils/widget/row_text.dart';
import 'custom_divider.dart';
import 'gray_container.dart';

class Details extends StatelessWidget {
  final String enterDate, outDate, clientName;
  const Details(
      {super.key,
      required this.enterDate,
      this.outDate = '',
      required this.clientName});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GrayContainer(
      padding: const EdgeInsets.only(right: 10),
      height: size.height * 0.15,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: [
              const Icon(Icons.watch_later_outlined),
              Padding(
                padding: const EdgeInsets.only(right: 10, left: 20),
                child: Text(
                  enterDate,
                  style: AppStyles.styleSemiBold16(context),
                ),
              ),
              const CustomDivider(),
              const SizedBox(
                width: 10,
              ),
              Text(
                outDate,
                style: AppStyles.styleSemiBold16(context),
              ),
            ],
          ),
          Row(
            children: [
              const Icon(CupertinoIcons.person),
              const SizedBox(
                width: 10,
              ),
              RowText(
                'اسم العميل : ',
                clientName,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
