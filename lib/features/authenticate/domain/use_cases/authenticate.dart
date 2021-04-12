import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:social_media_example/core/error/failures.dart';
import 'package:social_media_example/core/use_cases/usecase.dart';
import 'package:social_media_example/features/authenticate/domain/entities/user_info.dart';
import 'package:social_media_example/features/authenticate/domain/repositories/authenticatie_repository.dart';

class Authenticate implements UseCase<UserInfo, AuthenticateParams> {
  final AuthenticateRepository repository;

  Authenticate(this.repository);

  Future<Either<Failure, UserInfo>> call(AuthenticateParams params) async {
    return await repository.authenticateUser(
        params.userName, params.userPassword);
  }
}

class AuthenticateParams extends Equatable {
  final String userName;
  final String userPassword;
  AuthenticateParams({@required this.userName, @required this.userPassword})
      : super();
}
