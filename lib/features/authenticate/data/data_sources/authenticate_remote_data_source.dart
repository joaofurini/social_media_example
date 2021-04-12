import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:social_media_example/core/error/exceptions.dart';
import 'package:social_media_example/features/authenticate/data/models/user_info_model.dart';

abstract class AuthenticateRemoteDataSource {
  /// Calls the endpoint responsable to authenticate the user
  ///
  /// Throwa a [ServerException] for all error codes

  Future<UserInfoModel> authenticate(String userName, String userPassword) {
    throw UnimplementedError();
  }
}

class AuthenticateRemoteDataSourceImpl implements AuthenticateRemoteDataSource {
  final http.Client client;

  AuthenticateRemoteDataSourceImpl({@required this.client});

  @override
  Future<UserInfoModel> authenticate(String userName, String userPassword) =>
      _authenticate('http://numbersapi.com/');

  Future<UserInfoModel> _authenticate(String url) async {
    final response =
        await client.get(url, headers: {'Content-Type': 'application/json'});

    if (response.statusCode == 200) {
      return UserInfoModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}
