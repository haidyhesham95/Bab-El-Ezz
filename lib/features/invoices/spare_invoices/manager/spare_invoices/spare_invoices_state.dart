part of 'spare_invoices_cubit.dart';

@immutable
sealed class SpareInvoicesState {}

final class SpareInvoicesInitial extends SpareInvoicesState {}

class AddItems extends SpareInvoicesState {
  final List<Widget> items;
  AddItems(this.items);
}

class UpdateData extends SpareInvoicesState {}

class SearchData extends SpareInvoicesState {
  final List data;
  SearchData(this.data);
}
