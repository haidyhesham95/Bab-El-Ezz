part of 'maintenance_invoice_cubit.dart';

@immutable
sealed class MaintenanceInvoiceState {}

final class MaintenanceInvoiceInitial extends MaintenanceInvoiceState {}

final class AddItems extends MaintenanceInvoiceState {
  late final List<Widget> items;

  AddItems(this.items);
}

final class ChangeShowAllDataInvoices extends MaintenanceInvoiceState {
   final bool showAllDataInvoices;

  ChangeShowAllDataInvoices({ required this.showAllDataInvoices});
}

final class ChangeShowAllDataCustomers extends MaintenanceInvoiceState {
   final bool showAllDataCustomers;

  ChangeShowAllDataCustomers({ required this.showAllDataCustomers});
}