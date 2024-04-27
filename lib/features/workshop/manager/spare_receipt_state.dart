part of 'spare_receipt_cubit.dart';

@immutable
sealed class SpareReceiptState {}

final class SpareReceiptInitial extends SpareReceiptState {}
final class AddItems extends SpareReceiptState {
  final List<Widget> items;

  AddItems(this.items);
}