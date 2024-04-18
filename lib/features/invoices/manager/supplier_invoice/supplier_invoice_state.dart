part of 'supplier_invoice_cubit.dart';

@immutable
sealed class SupplierInvoiceState {}

final class SupplierInvoiceInitial extends SupplierInvoiceState {}

final class AddInvoiceItems extends SupplierInvoiceState {
  final List<Widget> items;

  AddInvoiceItems({required this.items});
}

final class AddSupplierItems extends SupplierInvoiceState {
  final List<Widget> items;

  AddSupplierItems({required this.items});
}
