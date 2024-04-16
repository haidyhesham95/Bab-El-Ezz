import 'package:flutter/material.dart';
import '../../../shared_utils/styles/text.dart';
import '../../../shared_utils/utils/widget/button_widget.dart';
import '../../../shared_utils/utils/widget/white_container.dart';
import '../../new_job-order/widgets/drop_button.dart';

class ItemDailyTable extends StatelessWidget {
  const ItemDailyTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      const WhiteContainer(text: ''),
      const SizedBox(
        width: 1,
      ),
      Expanded(
        flex: 2,
        child: DropButton(
          color: Colors.white,
          height: 25,
          hintText: '',
          borderRadius: 0,
          padding: EdgeInsets.zero,
          style: AppStyles.styleRegular10(context),
          iconSize: 10,
          //   value: ,
          onChanged: (String? value) {},
          items: const [
            DropdownMenuItem(
              value: 'عمل',
              child: Text('عمل '),
            ),
            DropdownMenuItem(
              value: 'اجازة',
              child: Text('اجازة '),
            ),
          ],
        ),
      ),
      const SizedBox(
        width: 1,
      ),
      const WhiteContainer(text: ''),
      const SizedBox(
        width: 1,
      ),
      const WhiteContainer(text: ''),
      const SizedBox(
        width: 1,
      ),
      const WhiteContainer(text: ''),
      const SizedBox(
        width: 1,
      ),
      const WhiteContainer(
        text: '',
      ),
      const SizedBox(
        width: 1,
      ),
      const WhiteContainer(text: ''),
      const SizedBox(
        width: 1,
      ),
      const WhiteContainer(
        text: '',
        flex: 3,
      ),
      const SizedBox(
        width: 1,
      ),
      Expanded(
        flex: 3,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 1),
          height: 25,
          color: Colors.white,
          child: Center(
              child: ButtonWidget(
                height: 22,
                onPressed: () {
                  Navigator.of(context).pushNamed('accountClearancePage');
                },
                text: 'تصفية حساب',
                fontStyle: AppStyles.styleRegular8(context),
                borderRadius: 4,
              )),
        ),
      ),
    ]);
  }
}
