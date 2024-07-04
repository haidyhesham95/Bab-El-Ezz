import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocWrapper<C extends Cubit<S>, S> extends StatelessWidget {
  final Widget child;
  final C Function(BuildContext context) create;

  const BlocWrapper({super.key, 
    required this.child,
    required this.create,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<C>(
      create: create,
      child: BlocBuilder<C, S>(
        builder: (context, state) {
          // You can optionally access the cubit here
          // if needed using context.read<C>()
          return child;
        },
      ),
    );
  }
}
