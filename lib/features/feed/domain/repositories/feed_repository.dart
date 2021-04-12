import 'package:dartz/dartz.dart';
import 'package:social_media_example/core/error/failures.dart';
import 'package:social_media_example/features/feed/domain/entities/feed_info.dart';

abstract class FeedRepository {
  Future<Either<Failure, List<FeedInfo>>> getFeed();
}
