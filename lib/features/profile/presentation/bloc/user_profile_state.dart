part of 'user_profile_bloc.dart';

abstract class UserProfileState extends Equatable {
  final UserProfile userProfile;

  final String errorMessage;
  UserProfileState({this.userProfile, this.errorMessage});
}

class Empty extends UserProfileState {}

class LoadingUserProfile extends UserProfileState {}

class LoadedUserProfile extends UserProfileState {
  final UserProfile userProfile;

  LoadedUserProfile({
    this.userProfile,
  }) : super(
          userProfile: userProfile,
        );
}

class Error extends UserProfileState {
  final String message;

  Error({this.message}) : super(errorMessage: message);
}
