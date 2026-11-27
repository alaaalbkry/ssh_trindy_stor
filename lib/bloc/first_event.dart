part of 'first_bloc.dart';

@immutable
abstract class FirstEvent {}

class SignnupRequested extends FirstEvent {
  final String name;
  final String email;
  final String password;
  SignnupRequested(this.name, this.password, this.email);
}

class LogIn extends FirstEvent {
  final String email;
  final String password;
  LogIn(
    this.email,
    this.password,
  );
}

class Checked extends FirstEvent {
  final bool checked;
  Checked({required this.checked});
}

class ResentpasswordEvent extends FirstEvent {
  final String email;
  ResentpasswordEvent(this.email);
}
