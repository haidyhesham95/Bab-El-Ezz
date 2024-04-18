part of 'store_cubit.dart';

@immutable
sealed class StoreState {}

final class StoreInitial extends StoreState {}

final class StoreItemsAdded extends StoreState {
  final List<Widget> items;

  StoreItemsAdded(this.items);
}
