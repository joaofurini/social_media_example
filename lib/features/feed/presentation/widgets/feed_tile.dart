import 'package:flutter/material.dart';
import 'package:social_media_example/features/feed/domain/entities/feed_info.dart';

class FeedTile extends StatelessWidget {
  final FeedInfo feed;

  FeedTile({this.feed});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.of(context).push(
        //   MaterialPageRoute(
        //     builder: (context) => NewsContentPage(
        //       newsId: news.id,
        //     ),
        //   ),
        // );
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        child: Expanded(
          //height: MediaQuery.of(context).size.height / 10,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.network(
                      "${feed.userProfilePicture}",
                      height: 60,
                      width: 60,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                    child: Text(
                      "${feed.userName}",
                      style: TextStyle(color: Colors.grey[800]),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                ],
              ),
              Text(
                "${feed.post}",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    "${feed.postDate} ",
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
