import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_example/features/feed/domain/use_case/get_feed.dart';
import 'package:social_media_example/features/feed/presentation/bloc/feed_bloc.dart';
import 'package:social_media_example/features/feed/presentation/widgets/feed_page_component.dart';
import 'package:social_media_example/features/feed/presentation/widgets/feed_tile.dart';
import 'package:social_media_example/features/profile/presentation/presentation/user_profile_page.dart';
import 'package:social_media_example/injection_container.dart';

class FeedPage extends StatefulWidget with FeedPageComponent {
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
      drawer: widget.drawer(context),
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
                        widget.loading(context);
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
                                //

                                widget.feedTitle(),
                                widget.feedList(state.feed),

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
