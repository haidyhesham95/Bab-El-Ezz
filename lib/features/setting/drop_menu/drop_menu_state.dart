part of 'drop_menu_cubit.dart';

@immutable
sealed class DropMenuState {}

final class DropMenuInitial extends DropMenuState {}

final class ChangeSelectedIndex extends DropMenuState {
  final int index;

  ChangeSelectedIndex(this.index);
}
