part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  AuthenticationEvent([List props = const <dynamic>[]]) : super();
}

class StartUserAuthenticationEvent extends AuthenticationEvent {
  final String userName;
  final String userPassword;

  StartUserAuthenticationEvent(this.userName, this.userPassword)
      : super([userName, userPassword]);
}
