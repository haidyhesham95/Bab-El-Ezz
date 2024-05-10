import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/workshop/add_client/widget/otp.dart';
import '../../shared_utils/utils/widget/pay_container.dart';
import 'letters_otp.dart';
import '../manager/car_number_cubit.dart';

class CarNumber extends StatefulWidget {
  const CarNumber({super.key});

  @override
  State<CarNumber> createState() => _CarNumberState();
}

class _CarNumberState extends State<CarNumber> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => CarNumberCubit(),
        child: BlocConsumer<CarNumberCubit, CarNumberState>(
          listener: (context, state) {},
          builder: (context, state) {
            CarNumberCubit cubit = CarNumberCubit.get(context);

            Widget otpWidget;
            if (cubit.isTappedNumber) {
              otpWidget = Otp();
            } else {
              otpWidget = LettersOtp();
            }

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 15),
                PayContainer(
                  title: " حروف و ارقام ",
                  onTap: () {
                    cubit.littersTapped();
                  },
                  isTapped: cubit.isTappedLitter,
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
      ),
    );
  }
}
