import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../generated/assets.dart';
import 'build_item.dart';

class InvoiceBody extends StatelessWidget {
  final BuildContext context;
  final List<CategoryItem> categories;

  InvoiceBody({Key? key, required this.context})
      : categories = [
    CategoryItem(
      label: " فواتير الصيانة",
      icon: SvgPicture.asset(
        Assets.imagesGroup1,
      ),
      onTap: () {
        Navigator.pushNamed(context, 'maintenanceInvoices');
      },
    ),
    CategoryItem(
      onTap: () {
        Navigator.pushNamed(context, 'supplierInvoices');
      },
      label: " فواتير الموردين ",
      icon: SvgPicture.asset(
        Assets.imagesGroup2,
      ),
    ),
    CategoryItem(
      onTap: () {
        Navigator.pushNamed(context, 'spareInvoices');
      },
      label: 'فواتير قطع الغيار',
      icon: SvgPicture.asset(
        Assets.imagesSpareInvoice,
      ),
    ),
    CategoryItem(
      onTap: () {
        Navigator.pushNamed(context, 'returnedInvoices');
      },
      label: 'فواتير مرتجع قطع غيار',
      icon: SvgPicture.asset(
        Assets.imagesReturnedInvoices,
      ),
    ),
  ],
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GridView.builder(

        padding: const EdgeInsets.symmetric(horizontal: 5),
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 5,
          mainAxisSpacing: 20,
          mainAxisExtent: 225,
        ),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return buildItem(categories[index], context);
        },
      ),
    );
  }
}

class CategoryItem {
  final String label;
  final Widget icon;
  final void Function()? onTap;

  CategoryItem({
    required this.label,
    required this.icon,
    required this.onTap,
  });
}
