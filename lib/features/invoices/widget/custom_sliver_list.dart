
import 'package:flutter/material.dart';

class CustomSliverList extends StatelessWidget {
  final List<Widget> items;

  const CustomSliverList({
    Key? key,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      separatorBuilder: (context, index) => const SizedBox(height: 1),
      itemCount: items.length,
      itemBuilder: (context, index) => items[index],
    );
  }
}
