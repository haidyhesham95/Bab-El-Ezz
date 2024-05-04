import 'package:flutter/material.dart';

import 'otp_text_field.dart';

class Otp extends StatelessWidget {
  const Otp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        OtpTextField(previous: false,),
        OtpTextField(),
        OtpTextField(),
        OtpTextField(),





      ],
    );

  }
}
