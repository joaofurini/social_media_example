import 'package:meta/meta.dart';

import 'package:social_media_example/features/feed/domain/entities/feed_info.dart';
import 'package:social_media_example/features/profile/domain/entities/user_profile.dart';

class UserProfileModel extends UserProfile {
  UserProfileModel({
    @required String name,
    @required String email,
    @required String idade,
  }) : super(
          name: name,
          email: email,
          idade: idade,
        );

  factory UserProfileModel.fromJson(Map<String, dynamic> json) {
    return UserProfileModel(
      name: json["name"],
      email: json["email"],
      idade: json["idade"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "email": email,
      "idade": idade,
    };
  }
}
