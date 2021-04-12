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

part 'feed_event.dart';
part 'feed_state.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';
const String INVALID_INPUT_FAILURE_MESSAGE =
    'Invalid Input - The nubmer must be a positive integer';

class FeedBloc extends Bloc<FeedEvent, FeedState> {
  final GetFeed getFeed;

  final InputConverter inputConverter;
  FeedBloc({
    @required this.getFeed,
    @required this.inputConverter,
  }) : assert(inputConverter != null);

  @override
  Stream<FeedState> mapEventToState(
    FeedEvent event,
  ) async* {
    if (event is GetFeedEvent) {
      yield LoadingFeed();

      final failureOrNews = await getFeed(NoParams());

      yield* _eitherLoadedOrErrorState(failureOrNews);
    }

    // TODO: implement mapEventToState
  }

  Stream<FeedState> _eitherLoadedOrErrorState(
      Either<Failure, List<FeedInfo>> failureOrFeed) async* {
    List<String> taglist = [];

    yield failureOrFeed
        .fold((error) => Error(message: _mapFailureToMessage(error)), (feed) {
      return LoadedFeed(feed: feed);
    });
  }

  @override
  // TODO: implement initialState
  FeedState get initialState => Empty();

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
