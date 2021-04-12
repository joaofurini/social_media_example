import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:social_media_example/core/api/api_mapper.dart';
import 'package:social_media_example/core/error/exceptions.dart';
import 'package:social_media_example/core/fixtures/fixture_reader.dart';
import 'package:social_media_example/features/feed/data/models/feed_info_model.dart';
import 'package:social_media_example/features/feed/domain/entities/feed_info.dart';

abstract class FeedRemoteDataSource {
  /// Calls the endpoint responsable to getFeed the user
  ///
  /// Throwa a [ServerException] for all error codes

  Future<List<FeedInfoModel>> getFeed() {
    throw UnimplementedError();
  }
}

class FeedRemoteDataSourceImpl implements FeedRemoteDataSource {
  final Dio client;

  FeedRemoteDataSourceImpl({@required this.client});

  @override
  Future<List<FeedInfoModel>> getFeed() => _getFeed('http://numbersapi.com/');

  Future<List<FeedInfoModel>> _getFeed(String url) async {
    List<Map<String, dynamic>> feedlist = [
      {
        "post": "Comprou ações da Petrobrás à R\$23.77",
        "userProfilePicture":
            "https://www.frasesparawhats.com.br/images/blog/2020/05/foto-de-perfil.jpg",
        "postDate": "12/12/12",
        "userName": "Maria Roberta"
      },
      {
        "post": "Comprou ações da Apple à R\$123.42",
        "userProfilePicture":
            "https://investidorsardinha.r7.com/wp-content/uploads/2020/08/primo-rico-perfil-1024x1024.png",
        "postDate": "12/12/2021",
        "userName": "Thiago Nigro"
      },
      {
        "post": "Comprou ações da Amazon à R\$3110.05",
        "userProfilePicture":
            "https://investidorsardinha.r7.com/wp-content/uploads/2020/08/primo-rico-perfil-1024x1024.png",
        "postDate": "12/12/2021",
        "userName": "Thiago Nigro"
      },
      {
        "post": "Comprou três países médios",
        "userProfilePicture":
            "https://medias.cnnbrasil.com.br/warren-buffett.jpeg?format=JPEG&image=https://mediastorage.cnnbrasil.com.br/IMAGES/00/00/02/27453_977E1825055FC622.JPG&width=576&height=390&resize=CROP",
        "postDate": "12/12/2021",
        "userName": "Warren Buffet"
      },
      {
        "post": "Comprou ações da Apple à R\$123.42",
        "userProfilePicture":
            "https://i0.wp.com/revistaempreende.com.br/wp-content/uploads/2020/03/MG_6006NAT-ARCURI-BRUTAS-3790458544-1583953189126-1.jpg?fit=4544%2C3119&ssl=1",
        "postDate": "12/12/2021",
        "userName": "Nathalia Arcuri"
      },
    ];

    return Future.value(
        feedlist.map((feedInfo) => FeedInfoModel.fromJson(feedInfo)).toList());
  }
}
