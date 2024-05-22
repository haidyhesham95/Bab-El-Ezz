import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/workshop/add_client/widget/otp.dart';
import '../../shared_utils/utils/widget/pay_container.dart';
import '../manager/car_number_cubit.dart';
import 'letters_otp.dart';

class CarNumber extends StatefulWidget {
  final GlobalKey? otpKey;
  final GlobalKey? lettersOtpKey;
  const CarNumber({super.key, this.otpKey, this.lettersOtpKey});

  @override
  State<CarNumber> createState() => _CarNumberState();
}

class _CarNumberState extends State<CarNumber> {
  String plateNumber = '';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CarNumberCubit(),
      child: BlocConsumer<CarNumberCubit, CarNumberState>(
        listener: (context, state) {},
        builder: (context, state) {
          CarNumberCubit cubit = CarNumberCubit.get(context);
          Widget otpWidget;
          if (cubit.isTappedNumber) {
            otpWidget = Otp(
              key: widget.otpKey,
            );
          } else {
            otpWidget = LettersOtp(
              key: widget.lettersOtpKey,
            );
          }
          // final licensePlate = otpWidget!.children
          //     .map((child) => (child as OtpTextField).controller.text)
          //     .join();

          return Column(
            children: [
              const SizedBox(height: 15),
              PayContainer(
                title: " حروف و ارقام ",
                onTap: () {
                  cubit.lettersTapped();
                },
                isTapped: cubit.isTappedLetter,
              ),
              const SizedBox(height: 10),
              PayContainer(
                title: " ارقام فقط ",
                onTap: () {
                  cubit.numberTapped();
                },
                isTapped: cubit.isTappedNumber,
              ),
              const SizedBox(
                height: 20,
              ),
              otpWidget, // Display the OTP input field based on the condition
            ],
          );
        },
      ),
    );
  }
}
