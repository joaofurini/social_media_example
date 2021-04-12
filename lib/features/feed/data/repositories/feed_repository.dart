import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:social_media_example/core/error/exceptions.dart';
import 'package:social_media_example/core/error/failures.dart';
import 'package:social_media_example/core/network/network_info.dart';
import 'package:social_media_example/features/feed/data/data_source/feed_remote_data_source.dart';
import 'package:social_media_example/features/feed/domain/entities/feed_info.dart';
import 'package:social_media_example/features/feed/domain/repositories/feed_repository.dart';

typedef Future<List<FeedInfo>> _GetNews();

typedef Future<FeedInfo> _GetSingleNewById();

class FeedRepositoryImpl implements FeedRepository {
  final FeedRemoteDataSource feedRemoteDataSource;
  final NetworkInfo networkInfo;

  FeedRepositoryImpl({
    @required this.networkInfo,
    @required this.feedRemoteDataSource,
  });

  @override
  Future<Either<Failure, List<FeedInfo>>> getFeed() async {
    return await _getNews(() {
      return feedRemoteDataSource.getFeed();
    });
  }

  Future<Either<Failure, List<FeedInfo>>> _getNews(_GetNews _getNews) async {
    if (await networkInfo.isConnected) {
      try {
        final news = await _getNews();

        //newsletterRemoteDataSource.getNews();

        return Right(news);
      } on ServerException {
        return Left(ServerFailure());
      }
    }
  }
}
