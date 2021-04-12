part of 'authentication_bloc.dart';

abstract class AuthenticationState extends Equatable {
  final UserInfo userInfo;
  final String errorMessage;
  AuthenticationState({this.userInfo, this.errorMessage});
}

class AuthenticationStateEmpty extends AuthenticationState {}

class AuthenticationStateLoading extends AuthenticationState {}

class AuthenticationStateLoaded extends AuthenticationState {
  final UserInfo userInfo;

  AuthenticationStateLoaded({this.userInfo}) : super(userInfo: userInfo);
}

class AuthenticationStateError extends AuthenticationState {
  final String message;

  AuthenticationStateError({this.message}) : super(errorMessage: message);
}
