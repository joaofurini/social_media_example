import 'package:meta/meta.dart';

import 'package:social_media_example/features/feed/domain/entities/feed_info.dart';

class FeedInfoModel extends FeedInfo {
  FeedInfoModel(
      {@required String post,
      @required String userProfilePicture,
      @required String userName,
      @required String postDate})
      : super(
            post: post,
            userName: userName,
            userProfilePicture: userProfilePicture,
            postDate: postDate);

  factory FeedInfoModel.fromJson(Map<String, dynamic> json) {
    return FeedInfoModel(
        post: json["post"],
        userProfilePicture: json["userProfilePicture"],
        userName: json["userName"],
        postDate: json["postDate"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "post": post,
      "userName": userName,
      "userProfilePicture": userProfilePicture,
      "postDate": postDate
    };
  }
}
