import 'package:flutter/material.dart';
import 'package:social_media_example/features/feed/domain/entities/feed_info.dart';
import 'package:social_media_example/features/feed/presentation/widgets/feed_tile.dart';
import 'package:social_media_example/features/profile/presentation/presentation/user_profile_page.dart';

class FeedPageComponent {
  Widget drawer(BuildContext context) {
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Column(
              children: [
                Text("Bem vindo"),
                SizedBox(
                  height: 10,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset(
                    "assets/imagens/perfil.jpg",
                    height: 100,
                    width: 100,
                  ),
                )
              ],
            ),
            decoration: BoxDecoration(
              color: Colors.black38,
            ),
          ),
          Center(
            child: ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.supervised_user_circle),
                      SizedBox(
                        width: 10,
                      ),
                      Text('Perfil'),
                    ],
                  ),
                  Icon(Icons.arrow_forward_ios)
                ],
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  fullscreenDialog: false,
                  builder: (context) => UserProfilePage(),
                ));
                // Update the state of the app.
                // ...
              },
            ),
          )
        ],
      ),
    );
  }

  Widget loading(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height / 2.5,
        ),
        Center(
          child: CircularProgressIndicator(),
        ),
      ],
    );
  }

  Widget feedTitle() {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 10),
      child: Text(
        "SEU FEED",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget feedList(List<FeedInfo> feed) {
    return ListView.separated(
      separatorBuilder: (context, index) => Divider(
        thickness: 1,
      ),
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: feed.length,
      itemBuilder: (context, index) {
        print(feed);
        return FeedTile(
          feed: feed[index],
        );
      },
    );
  }
}
