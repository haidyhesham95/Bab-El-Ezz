import 'package:flutter/material.dart';
import '../../../shared_utils/utils/widget/point_container.dart';
import '../../../shared_utils/utils/widget/white_container.dart';

class SliverListInvoice extends StatelessWidget {
  const SliverListInvoice({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(

      separatorBuilder: (context, index) => const SizedBox(height: 1,),

      itemCount: 3,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Row(
            children: [
              PointContainer(onPressed: (){}),
              const SizedBox(width: 1,),
              const WhiteContainer(text: ''),
              const SizedBox(width: 1,),
              const WhiteContainer(text: '',),
              const SizedBox(width: 1,),
              const WhiteContainer(text: ''),
              const SizedBox(width: 1,),
              const WhiteContainer(text: ''),
              const SizedBox(width: 1,),
              const WhiteContainer(text: ''),
              const SizedBox(width: 1,),
              const WhiteContainer(text: '',),
              const SizedBox(width: 1,),
              const WhiteContainer(text: ''),
              const SizedBox(width: 1,),
              const WhiteContainer(text: ''),
            ],
          ),
        );
      },
    );
  }
}
