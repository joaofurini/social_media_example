import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class UserInfo extends Equatable {
  final String userName;
  final String userPassword;

  UserInfo({@required this.userName, @required this.userPassword})
      : super([userName, userPassword]);
}
