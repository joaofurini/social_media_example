import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:social_media_example/core/network/network_info.dart';
import 'package:social_media_example/core/util/input_converter.dart';
import 'package:social_media_example/features/authenticate/data/data_sources/authenticate_remote_data_source.dart';
import 'package:social_media_example/features/authenticate/data/repositories/authenticate_repository_impl.dart';
import 'package:social_media_example/features/authenticate/domain/repositories/authenticatie_repository.dart';
import 'package:social_media_example/features/authenticate/domain/use_cases/authenticate.dart';
import 'package:social_media_example/features/authenticate/presentation/bloc/authentication_bloc.dart';
import 'package:social_media_example/features/feed/data/data_source/feed_remote_data_source.dart';
import 'package:social_media_example/features/feed/data/repositories/feed_repository.dart';
import 'package:social_media_example/features/feed/domain/repositories/feed_repository.dart';
import 'package:social_media_example/features/feed/domain/use_case/get_feed.dart';
import 'package:social_media_example/features/feed/presentation/bloc/feed_bloc.dart';
import 'package:social_media_example/features/profile/data/data_source/user_profile_data_source.dart';
import 'package:social_media_example/features/profile/data/repositories/user_profile_repository.dart';
import 'package:social_media_example/features/profile/domain/repositories/user_profile_repository.dart';
import 'package:social_media_example/features/profile/domain/use_case/get_user_profile.dart';
import 'package:social_media_example/features/profile/presentation/bloc/user_profile_bloc.dart';

final serviceLocator = GetIt.instance;

Future<void> init() async {
  //! Feature Login

  serviceLocator.registerFactory(
    () => AuthenticationBloc(
      authenticate: serviceLocator(),
      inputConverter: serviceLocator(),
    ),
  );

  // Use Cases
  serviceLocator.registerLazySingleton(() => Authenticate(serviceLocator()));

  // Repository
  serviceLocator.registerLazySingleton<AuthenticateRepository>(
      () => AuthenticateRepositoryImpl(
            authenticateRemoteDataSource: serviceLocator(),
            networkInfo: serviceLocator(),
          ));

  // Data sources
  serviceLocator.registerLazySingleton<AuthenticateRemoteDataSource>(
      () => AuthenticateRemoteDataSourceImpl(client: serviceLocator()));

  // serviceLocator.registerLazySingleton<AuthenticateLocalDataSource>(() =>
  //     AuthenticateLocalDataSourceImpl(sharedPreferences: serviceLocator()));

  //! Feature Feed
  serviceLocator.registerFactory(
    () => FeedBloc(
      getFeed: serviceLocator(),
      inputConverter: serviceLocator(),
    ),
  );

  // Use Cases
  serviceLocator.registerLazySingleton(() => GetFeed(serviceLocator()));

  // Repository
  serviceLocator.registerLazySingleton<FeedRepository>(() => FeedRepositoryImpl(
        feedRemoteDataSource: serviceLocator(),
        networkInfo: serviceLocator(),
      ));

  // Data sources
  serviceLocator.registerLazySingleton<FeedRemoteDataSource>(
      () => FeedRemoteDataSourceImpl(client: serviceLocator()));

  // serviceLocator.registerLazySingleton<AuthenticateLocalDataSource>(() =>
  //     AuthenticateLocalDataSourceImpl(sharedPreferences: serviceLocator()));
  //
  //! Feature User profile
  serviceLocator.registerFactory(
    () => UserProfileBloc(
      getUserProfile: serviceLocator(),
      inputConverter: serviceLocator(),
    ),
  );

  // Use Cases
  serviceLocator.registerLazySingleton(() => GetUserProfile(serviceLocator()));

  // Repository
  serviceLocator.registerLazySingleton<UserProfileRepository>(
      () => UserProfileRepositoryImpl(
            userProfileRemoteDataSource: serviceLocator(),
            networkInfo: serviceLocator(),
          ));

  // Data sources
  serviceLocator.registerLazySingleton<UserProfileRemoteDataSource>(
      () => UserProfileRemoteDataSourceImpl(client: serviceLocator()));

  // serviceLocator.registerLazySingleton<AuthenticateLocalDataSource>(() =>
  //     AuthenticateLocalDataSourceImpl(sharedPreferences: serviceLocator()));

  //! Core

  serviceLocator.registerLazySingleton(() => InputConverter());
  serviceLocator.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(serviceLocator()));

  //!External

  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();

  serviceLocator
      .registerLazySingleton<SharedPreferences>(() => sharedPreferences);
  serviceLocator.registerLazySingleton(() => http.Client());
  serviceLocator.registerLazySingleton(() => Dio());
  serviceLocator.registerLazySingleton(() => DataConnectionChecker());
}
