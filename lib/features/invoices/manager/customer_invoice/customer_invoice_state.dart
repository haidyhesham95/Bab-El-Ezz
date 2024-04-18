part of 'customer_invoice_cubit.dart';

@immutable
sealed class CustomerInvoiceState {}

final class CustomerInvoiceInitial extends CustomerInvoiceState {}

final class AddItems extends CustomerInvoiceState {
  final List<Widget> items;

  AddItems({required this.items});
}