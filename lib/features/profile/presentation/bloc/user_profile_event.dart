part of 'user_profile_bloc.dart';

abstract class UserProfileEvent extends Equatable {
  UserProfileEvent([List props = const <dynamic>[]]) : super();
}

class GetUserProfileEvent extends UserProfileEvent {
  GetUserProfileEvent() : super([]);
}

class GetSingleNewByIdEvent extends UserProfileEvent {
  final int newId;

  GetSingleNewByIdEvent(this.newId) : super([newId]);
}
