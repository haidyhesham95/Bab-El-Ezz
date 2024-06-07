part of 'supplier_invoice_cubit.dart';

@immutable
sealed class SupplierInvoiceState {}

final class SupplierInvoiceInitial extends SupplierInvoiceState {}

final class AddInvoiceItems extends SupplierInvoiceState {
  late final List<Widget> invoicesItems;

  AddInvoiceItems(this.invoicesItems);
}

final class AddSupplierItems extends SupplierInvoiceState {
  late final List<Widget> suppliersItems;

  AddSupplierItems(this.suppliersItems);
}

final class AddSupplierValueChanged extends SupplierInvoiceState {
  final String? value;

  AddSupplierValueChanged(this.value);
}

final class UpdateData extends SupplierInvoiceState {}

final class SearchData extends SupplierInvoiceState {
  final List data;

  SearchData(this.data);
}
