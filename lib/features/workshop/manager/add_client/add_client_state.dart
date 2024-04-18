part of 'add_client_cubit.dart';

@immutable
sealed class AddClientState {}

final class AddClientInitial extends AddClientState {}

final class ManualTapped extends AddClientState {
  final bool isTapped ;

  ManualTapped(this.isTapped);
}
final class AutomaticTapped extends AddClientState {
  final bool isTapped ;

  AutomaticTapped(this.isTapped);
}

final class NumberTapped extends AddClientState {
  final bool isTapped ;

  NumberTapped(this.isTapped);
}

final class CharactersTapped extends AddClientState {
  final bool isTapped ;

  CharactersTapped(this.isTapped);
}
