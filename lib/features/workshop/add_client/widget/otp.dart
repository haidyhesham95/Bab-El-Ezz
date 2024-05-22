import 'package:flutter/material.dart';

import 'otp_text_field.dart';

class Otp extends StatefulWidget {
  // Changed to StatefulWidget
  const Otp({Key? key}) : super(key: key);

  @override
  OtpState createState() => OtpState();
}

class OtpState extends State<Otp> {
  // Added State class
  late final TextEditingController otpController1;
  late final TextEditingController otpController2;
  late final TextEditingController otpController3;
  late final TextEditingController otpController4;

  @override
  void initState() {
    super.initState();
    otpController1 = TextEditingController();
    otpController2 = TextEditingController();
    otpController3 = TextEditingController();
    otpController4 = TextEditingController();
  }

  @override
  void dispose() {
    otpController1.dispose();
    otpController2.dispose();
    otpController3.dispose();
    otpController4.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        OtpTextField(controller: otpController1, previous: false),
        OtpTextField(controller: otpController2),
        OtpTextField(controller: otpController3),
        OtpTextField(controller: otpController4),
      ],
    );
  }
}
