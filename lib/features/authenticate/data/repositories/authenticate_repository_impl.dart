import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:social_media_example/core/error/exceptions.dart';
import 'package:social_media_example/core/error/failures.dart';
import 'package:social_media_example/core/network/network_info.dart';
import 'package:social_media_example/features/authenticate/data/data_sources/authenticate_remote_data_source.dart';
import 'package:social_media_example/features/authenticate/domain/entities/user_info.dart';
import 'package:social_media_example/features/authenticate/domain/repositories/authenticatie_repository.dart';

typedef Future<UserInfo> _AuthenticateUser();

class AuthenticateRepositoryImpl implements AuthenticateRepository {
  final AuthenticateRemoteDataSource authenticateRemoteDataSource;
  final NetworkInfo networkInfo;

  AuthenticateRepositoryImpl({
    @required this.networkInfo,
    @required this.authenticateRemoteDataSource,
  });
  @override
  Future<Either<Failure, UserInfo>> authenticateUser(
      String userName, String userPassword) async {
    return await _authenticateUser(() {
      return authenticateRemoteDataSource.authenticate(userName, userPassword);
    });
  }

  Future<Either<Failure, UserInfo>> _authenticateUser(
      _AuthenticateUser _authenticateUser) async {
    if (await networkInfo.isConnected)
      try {
        final userInfo = await _authenticateUser();

        return Right(userInfo);
      } on ServerException {
        return Left(ServerFailure());
      }
    else {
      return Left(ServerFailure());
    }
  }
}
