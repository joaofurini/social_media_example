import 'package:dartz/dartz.dart';
import 'package:social_media_example/core/error/failures.dart';
import 'package:social_media_example/features/authenticate/domain/entities/user_info.dart';

abstract class AuthenticateRepository {
  Future<Either<Failure, UserInfo>> authenticateUser(
      String name, String password);
}
