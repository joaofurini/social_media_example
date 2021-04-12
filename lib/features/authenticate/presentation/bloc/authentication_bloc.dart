import 'dart:async';
import 'package:bloc/bloc.dart';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:social_media_example/core/error/failures.dart';
import 'package:social_media_example/core/util/input_converter.dart';
import 'package:social_media_example/features/authenticate/domain/entities/user_info.dart';
import 'package:social_media_example/features/authenticate/domain/use_cases/authenticate.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';
const String INVALID_INPUT_FAILURE_MESSAGE =
    'Invalid Input - The nubmer must be a positive integer';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final Authenticate authenticate;

  final InputConverter inputConverter;
  AuthenticationBloc({
    @required this.authenticate,
    @required this.inputConverter,
  })  : assert(authenticate != null),
        assert(inputConverter != null);

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is StartUserAuthenticationEvent) {
      // final inputEither =
      //     inputConverter.stringToUnsignedInteger(event.numberString);

      yield AuthenticationStateLoading();

      final failureOrTrivia = await authenticate(AuthenticateParams(
          userName: event.userName, userPassword: event.userPassword));

      yield* _eitherLoadedOrErrorState(failureOrTrivia);
    }
  }

  Stream<AuthenticationState> _eitherLoadedOrErrorState(
      Either<Failure, UserInfo> failureOrUser) async* {
    yield failureOrUser.fold(
        (error) =>
            AuthenticationStateError(message: _mapFailureToMessage(error)),
        (userInfo) => AuthenticationStateLoaded(userInfo: userInfo));
  }

  @override
  AuthenticationState get initialState => AuthenticationStateEmpty();

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;

        break;
      case CacheFailure:
        return CACHE_FAILURE_MESSAGE;
      default:
        return 'unexpected error';
    }
  }
}
