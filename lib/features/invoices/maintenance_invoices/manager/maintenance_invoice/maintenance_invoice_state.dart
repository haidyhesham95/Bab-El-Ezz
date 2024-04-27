part of 'maintenance_invoice_cubit.dart';

@immutable
sealed class MaintenanceInvoiceState {}

final class MaintenanceInvoiceInitial extends MaintenanceInvoiceState {}

final class AddItems extends MaintenanceInvoiceState {
  late final List<Widget> items;

  AddItems(this.items);
}