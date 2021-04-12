import 'package:meta/meta.dart';
import 'package:social_media_example/features/authenticate/domain/entities/user_info.dart';

class UserInfoModel extends UserInfo {
  UserInfoModel({
    @required String userName,
    @required String userPassword,
  }) : super(userName: userName, userPassword: userPassword);

  factory UserInfoModel.fromJson(Map<String, dynamic> json) {
    return UserInfoModel(
      userName: json['user_name'],
      userPassword: json['user_password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {"user_name": userName, "userPassword": userPassword};
  }
}
