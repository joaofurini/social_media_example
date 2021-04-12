import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:social_media_example/core/error/exceptions.dart';
import 'package:social_media_example/core/error/failures.dart';
import 'package:social_media_example/core/network/network_info.dart';

import 'package:social_media_example/features/feed/domain/entities/feed_info.dart';

import 'package:social_media_example/features/profile/data/data_source/user_profile_data_source.dart';
import 'package:social_media_example/features/profile/domain/entities/user_profile.dart';
import 'package:social_media_example/features/profile/domain/repositories/user_profile_repository.dart';

typedef Future<UserProfile> _GetUserProfile();

typedef Future<FeedInfo> _GetSingleNewById();

class UserProfileRepositoryImpl implements UserProfileRepository {
  final UserProfileRemoteDataSource userProfileRemoteDataSource;
  final NetworkInfo networkInfo;

  UserProfileRepositoryImpl({
    @required this.networkInfo,
    @required this.userProfileRemoteDataSource,
  });

  @override
  Future<Either<Failure, UserProfile>> getUserProfile() async {
    return await _getUserProfile(() {
      return userProfileRemoteDataSource.getUserProfile();
    });
  }

  Future<Either<Failure, UserProfile>> _getUserProfile(
      _GetUserProfile _getUserProfile) async {
    if (await networkInfo.isConnected) {
      try {
        final userProfile = await _getUserProfile();

        //newsletterRemoteDataSource.getNews();

        return Right(userProfile);
      } on ServerException {
        return Left(ServerFailure());
      }
    }
  }
}
