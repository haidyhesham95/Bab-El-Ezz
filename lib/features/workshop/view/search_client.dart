import 'package:bab_el_ezz/shared_utils/styles/text.dart';
import 'package:bab_el_ezz/shared_utils/utils/widget/button_widget.dart';
import 'package:bab_el_ezz/shared_utils/utils/widget/const_appbar.dart';
import 'package:flutter/material.dart';
import '../../../shared_utils/utils/widget/container_search.dart';
import '../../../shared_utils/utils/widget/shadow_container.dart';
import '../widget/clip_path_gradient.dart';
import '../widget/grid_item.dart';

class SearchClient extends StatelessWidget {
  const SearchClient({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:constAppBar(context, 'بحث عن العميل'),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 40),
          clipBathGradient(context,text: 'البحث عن عميل',),
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                ButtonWidget(
                  borderRadius: 4,
                  width: 90,
                  text: 'اضافة عميل',
                  onPressed: (){
                    Navigator.pushNamed(context, 'addClient');
                  },
                  fontStyle: AppStyles.styleRegular14(context),
                ),
                SizedBox(width: 10,),
                Flexible(
                  child: ContainerSearch(
                    radius: 0,
                    hintText: 'بحث',
                    onPressed: (){},
                  ),
                ),
              ],
            ),
          ) ,
          SizedBox(height: 40,),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: 4,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 25,
                  mainAxisExtent: 100,
                ),
                itemBuilder:(BuildContext context, int index) {
                  return gridItem(context);
                }
            ),
          )
        ],
      ),

    );
  }
}
