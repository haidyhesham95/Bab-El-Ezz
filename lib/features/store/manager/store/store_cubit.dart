import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'store_state.dart';

class StoreCubit extends Cubit<StoreState> {
  StoreCubit() : super(StoreInitial());
  static StoreCubit get(context) => BlocProvider.of(context);

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController typeNameController = TextEditingController();
  TextEditingController typeNumberController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController brandController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController saleNumberController = TextEditingController();
  TextEditingController alertController = TextEditingController();








}
