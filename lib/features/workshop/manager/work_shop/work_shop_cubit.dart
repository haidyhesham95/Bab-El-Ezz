import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'work_shop_state.dart';

class WorkShopCubit extends Cubit<WorkShopState> {
  WorkShopCubit() : super(WorkShopInitial());

  static WorkShopCubit get(context) => BlocProvider.of(context);

   bool showAll = false;

    void toggleShowAll() {
      showAll = !showAll;
      emit(ShowAllLoaded(showAll: showAll));
    }

}
