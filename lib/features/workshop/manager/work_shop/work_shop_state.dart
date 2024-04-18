part of 'work_shop_cubit.dart';

@immutable
sealed class WorkShopState {}

final class WorkShopInitial extends WorkShopState {}

final class ShowAllLoaded extends WorkShopState {
  final bool showAll;

  ShowAllLoaded({
    required this.showAll,
  });
}
