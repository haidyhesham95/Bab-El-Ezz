part of 'supplier_invoice_cubit.dart';

@immutable
sealed class InvoiceState {}

final class SupplierInvoiceInitial extends InvoiceState {}

final class AddInvoiceItems extends InvoiceState {
  late final List<Widget> invoicesItems;

  AddInvoiceItems(this.invoicesItems);
}

final class AddSupplierItems extends InvoiceState {
  late final List<Widget> suppliersItems;

  AddSupplierItems(this.suppliersItems);
}

final class AddSupplierValueChanged extends InvoiceState {
  final String? value;

  AddSupplierValueChanged(this.value);
}

final class UpdateData extends InvoiceState {}

final class SearchData extends InvoiceState {
  final List data;

  SearchData(this.data);
}
