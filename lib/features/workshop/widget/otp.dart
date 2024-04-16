import 'package:bab_el_ezz/features/workshop/widget/otp_text_field.dart';
import 'package:flutter/material.dart';

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
