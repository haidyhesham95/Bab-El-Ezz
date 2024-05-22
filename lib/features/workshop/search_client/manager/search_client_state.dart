part of 'search_client_cubit.dart';

@immutable
sealed class SearchClientState {}

final class SearchClientInitial extends SearchClientState {}

final class GetData extends SearchClientState {
  final List<JobOrder> jobOrders;

  GetData(this.jobOrders);
}
