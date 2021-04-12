import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_example/features/feed/domain/use_case/get_feed.dart';
import 'package:social_media_example/features/feed/presentation/bloc/feed_bloc.dart';
import 'package:social_media_example/features/feed/presentation/widgets/feed_tile.dart';
import 'package:social_media_example/features/profile/presentation/presentation/user_profile_page.dart';
import 'package:social_media_example/injection_container.dart';

class FeedPage extends StatefulWidget {
  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  FeedBloc bloc = serviceLocator<FeedBloc>();

  @override
  void initState() {
    bloc.dispatch(GetFeedEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("asdffa");

    return Scaffold(
      drawer: Drawer(
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
                title: Text('Perfil'),
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
      ),
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          "Seu Feed de noticias",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: BlocProvider(
          builder: (_) => bloc,
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  BlocBuilder<FeedBloc, FeedState>(
                    builder: (context, state) {
                      if (state is LoadingFeed) {
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
                      if (state is LoadedFeed) {
                        return SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                // NewsTaglist(
                                //   taglist: state.taglist,
                                // ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 20, bottom: 10),
                                  child: Text(
                                    "SEU FEED",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),

                                ListView.separated(
                                  separatorBuilder: (context, index) => Divider(
                                    thickness: 1,
                                  ),
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: state.feed.length,
                                  itemBuilder: (context, index) {
                                    print(state);
                                    return FeedTile(
                                      feed: state.feed[index],
                                    );
                                  },
                                ),

                                Divider(
                                  thickness: 1,
                                ),

                                // ListView.separated(
                                //   separatorBuilder: (context, index) => Divider(
                                //     thickness: 1,
                                //   ),
                                //   physics: NeverScrollableScrollPhysics(),
                                //   shrinkWrap: true,
                                //   itemCount: state.news.length,
                                //   itemBuilder: (context, index) {
                                //     print(state);
                                //     return NewsTile(
                                //       news: state.news[index],
                                //     );
                                //   },
                                // )
                              ],
                            ),
                          ),
                        );
                      }

                      return Container();
                    },
                  )
                ],
              ),
            ),
          )),
    );
  }
}
