import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:social_media_example/core/error/failures.dart';
import 'package:social_media_example/core/use_cases/usecase.dart';
import 'package:social_media_example/core/util/input_converter.dart';
import 'package:social_media_example/features/feed/domain/entities/feed_info.dart';
import 'package:social_media_example/features/feed/domain/use_case/get_feed.dart';
import 'package:social_media_example/features/profile/domain/entities/user_profile.dart';
import 'package:social_media_example/features/profile/domain/use_case/get_user_profile.dart';

part 'user_profile_event.dart';
part 'user_profile_state.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';
const String INVALID_INPUT_FAILURE_MESSAGE =
    'Invalid Input - The nubmer must be a positive integer';

class UserProfileBloc extends Bloc<UserProfileEvent, UserProfileState> {
  final GetUserProfile getUserProfile;

  final InputConverter inputConverter;
  UserProfileBloc({
    @required this.getUserProfile,
    @required this.inputConverter,
  }) : assert(inputConverter != null);

  @override
  Stream<UserProfileState> mapEventToState(
    UserProfileEvent event,
  ) async* {
    if (event is GetUserProfileEvent) {
      yield LoadingUserProfile();

      final failureOrNews = await getUserProfile(NoParams());

      yield* _eitherLoadedOrErrorState(failureOrNews);
    }

    // TODO: implement mapEventToState
  }

  Stream<UserProfileState> _eitherLoadedOrErrorState(
      Either<Failure, UserProfile> failureOrUserProfile) async* {
    List<String> taglist = [];

    yield failureOrUserProfile.fold(
        (error) => Error(message: _mapFailureToMessage(error)), (userProfile) {
      return LoadedUserProfile(userProfile: userProfile);
    });
  }

  @override
  // TODO: implement initialState
  UserProfileState get initialState => Empty();

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
