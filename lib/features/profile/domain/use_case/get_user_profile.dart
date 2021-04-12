import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:social_media_example/core/error/failures.dart';
import 'package:social_media_example/core/use_cases/usecase.dart';
import 'package:social_media_example/features/feed/domain/entities/feed_info.dart';
import 'package:social_media_example/features/feed/domain/repositories/feed_repository.dart';
import 'package:social_media_example/features/profile/domain/entities/user_profile.dart';
import 'package:social_media_example/features/profile/domain/repositories/user_profile_repository.dart';

class GetUserProfile implements UseCase<UserProfile, NoParams> {
  final UserProfileRepository repository;

  GetUserProfile(this.repository);

  @override
  Future<Either<Failure, UserProfile>> call(NoParams params) async {
    return await repository.getUserProfile();
  }
}
