part of 'returned_invoices_cubit.dart';

@immutable
sealed class ReturnedInvoicesState {}

final class ReturnedInvoicesInitial extends ReturnedInvoicesState {}

class TypeChanged extends ReturnedInvoicesState {
  TypeChanged(this.value);

  final String? value;
}

class TypeMerchantChanged extends ReturnedInvoicesState {
  TypeMerchantChanged(this.value);

  final String? value;
}

class MerchantNameChanged extends ReturnedInvoicesState {
  MerchantNameChanged(this.value);

  final String? value;
}

class CompanyNameChanged extends ReturnedInvoicesState {
  CompanyNameChanged(this.value);

  final String? value;
}

class UpdateData extends ReturnedInvoicesState {}
