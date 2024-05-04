import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'drop_menu_state.dart';

class DropMenuCubit extends Cubit<DropMenuState> {
  DropMenuCubit() : super(DropMenuInitial());
  static DropMenuCubit get(context) => BlocProvider.of(context);

  int selectedIndex = 0;

  void changeIndex(int index) {
    selectedIndex = index;
    emit(ChangeSelectedIndex(index));
  }


}

