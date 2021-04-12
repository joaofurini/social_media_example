import 'package:dartz/dartz.dart';
import 'package:social_media_example/core/error/failures.dart';

import 'package:social_media_example/features/profile/domain/entities/user_profile.dart';

abstract class UserProfileRepository {
  Future<Either<Failure, UserProfile>> getUserProfile();
}
