part of 'feed_bloc.dart';

abstract class FeedEvent extends Equatable {
  FeedEvent([List props = const <dynamic>[]]) : super();
}

class GetFeedEvent extends FeedEvent {
  GetFeedEvent() : super([]);
}

class GetSingleNewByIdEvent extends FeedEvent {
  final int newId;

  GetSingleNewByIdEvent(this.newId) : super([newId]);
}
