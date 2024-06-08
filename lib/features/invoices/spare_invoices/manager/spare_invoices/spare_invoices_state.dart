part of 'spare_invoices_cubit.dart';

@immutable
sealed class SpareInvoicesState {}

final class SpareInvoicesInitial extends SpareInvoicesState {}

class AddItems extends SpareInvoicesState {
  final List<Widget> items;
  AddItems(this.items);
}
