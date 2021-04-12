import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:social_media_example/core/api/api_mapper.dart';
import 'package:social_media_example/core/error/exceptions.dart';
import 'package:social_media_example/core/fixtures/fixture_reader.dart';
import 'package:social_media_example/features/feed/data/models/feed_info_model.dart';
import 'package:social_media_example/features/feed/domain/entities/feed_info.dart';
import 'package:social_media_example/features/profile/data/models/user_profile_model.dart';
import 'package:social_media_example/features/profile/domain/entities/user_profile.dart';

abstract class UserProfileRemoteDataSource {
  /// Calls the endpoint responsable to getUserProfile the user
  ///
  /// Throwa a [ServerException] for all error codes

  Future<UserProfile> getUserProfile() {
    throw UnimplementedError();
  }
}

class UserProfileRemoteDataSourceImpl implements UserProfileRemoteDataSource {
  final Dio client;

  UserProfileRemoteDataSourceImpl({@required this.client});

  @override
  Future<UserProfile> getUserProfile() =>
      _getUserProfile('http://numbersapi.com/');

  Future<UserProfile> _getUserProfile(String url) async {
    final Map<String, dynamic> userInfo = {
      "name": "Joao Pedro Adao Furini",
      "idade": "20",
      "email": "jp.furini@hotmail.com"
    };

    return Future.value(UserProfileModel.fromJson(userInfo));
  }
}
