import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:social_media_example/core/error/failures.dart';
import 'package:social_media_example/core/use_cases/usecase.dart';
import 'package:social_media_example/features/feed/domain/entities/feed_info.dart';
import 'package:social_media_example/features/feed/domain/repositories/feed_repository.dart';

class GetFeed implements UseCase<List<FeedInfo>, NoParams> {
  final FeedRepository repository;

  GetFeed(this.repository);

  @override
  Future<Either<Failure, List<FeedInfo>>> call(NoParams params) async {
    return await repository.getFeed();
  }
}
