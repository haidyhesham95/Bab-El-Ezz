import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'daily_table_state.dart';

class DailyTableCubit extends Cubit<DailyTableState> {
  DailyTableCubit() : super(DailyTableInitial());

  static DailyTableCubit get(context) => BlocProvider.of(context);


  String? selectedType;

  void setSelectedType(String? value) {
    selectedType = value;
    emit(SelectedTypeChanged(value));
  }

}
