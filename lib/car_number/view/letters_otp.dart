import 'package:flutter/material.dart';

import '../../features/workshop/add_client/widget/otp_text_field.dart';
import '../../shared_utils/utils/widget/text_field.dart';

class LettersOtp extends StatefulWidget {
  const LettersOtp({Key? key}) : super(key: key);

  @override
  LettersOtpState createState() => LettersOtpState();
}

class LettersOtpState extends State<LettersOtp> {
  final TextEditingController otpController1 = TextEditingController();
  final TextEditingController otpController2 = TextEditingController();
  final TextEditingController otpController3 = TextEditingController();
  final TextEditingController otpController4 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      // Removed const keyword
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          OtpTextField(
            previous: false,
            controller: otpController1,
          ),
          const SizedBox(
            width: 10,
          ),
          OtpTextField(
            controller: otpController2,
          ),
          const SizedBox(
            width: 10,
          ),
          OtpTextField(
            controller: otpController3,
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: TextFieldWidget(
              height: 50,
              // maxLength: 3,
              controller: otpController4,
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
