part of 'new_job_cubit.dart';

@immutable
sealed class NewJobState {}

final class NewJobInitial extends NewJobState {}

final class AddClientValueChanged extends NewJobState {
  final String? value;

  AddClientValueChanged(this.value);
}

final class AddMaintenanceValueChanged extends NewJobState {
  final String? value;

  AddMaintenanceValueChanged(this.value);
}

final class CashTapped extends NewJobState {
  final bool isTapped1;

  CashTapped(this.isTapped1);
}

final class ElectronicTapped extends NewJobState {
  final bool isTapped2;

  ElectronicTapped(this.isTapped2);
}

final class AddItems extends NewJobState {
  final List<Widget> items;

  AddItems(this.items);
}

final class GetData extends NewJobState {
  final List data;
  GetData(this.data);
}

final class UpdateData extends NewJobState {}
