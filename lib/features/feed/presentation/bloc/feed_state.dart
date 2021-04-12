part of 'feed_bloc.dart';

abstract class FeedState extends Equatable {
  final List<FeedInfo> feed;

  final String errorMessage;
  FeedState({this.feed, this.errorMessage});
}

class Empty extends FeedState {}

class LoadingFeed extends FeedState {}

class LoadedFeed extends FeedState {
  final List<FeedInfo> feed;

  LoadedFeed({
    this.feed,
  }) : super(
          feed: feed,
        );
}

class Error extends FeedState {
  final String message;

  Error({this.message}) : super(errorMessage: message);
}
