import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class FeedInfo extends Equatable {
  final String post;
  final String userProfilePicture;
  final String postDate;
  final String userName;

  FeedInfo({
    @required this.post,
    @required this.userProfilePicture,
    @required this.userName,
    @required this.postDate,
  }) : super([post, userProfilePicture, postDate]);
}
