part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class ShowPasswordInLogin extends LoginState {}

final class UpdateData extends LoginState {}
