import 'package:flutter/material.dart';

import '../../features/workshop/add_client/widget/otp_text_field.dart';
import '../../shared_utils/utils/widget/text_field.dart';

class LettersOtp extends StatelessWidget {
  const LettersOtp({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          OtpTextField(previous: false,),
          SizedBox(width: 10,),
          OtpTextField(),
          SizedBox(width: 10,),

          OtpTextField(),
          SizedBox(width: 10,),
          Expanded(
            child: TextFieldWidget(
              height: 50,
             // maxLength: 3,
              hintText: " ادخل الحروف ",
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.text,

            ),
          ),





        ],
      ),
    );

  }
}