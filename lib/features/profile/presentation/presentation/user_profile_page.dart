import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:social_media_example/features/profile/presentation/bloc/user_profile_bloc.dart';
import 'package:social_media_example/features/profile/presentation/widgets/user_profile_page_component.dart';
import 'package:social_media_example/injection_container.dart';

class UserProfilePage extends StatefulWidget with UserProfilePageComponent {
  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  UserProfileBloc bloc = serviceLocator<UserProfileBloc>();
  bool isUserNameOpen = false;

  @override
  void initState() {
    bloc.dispatch(GetUserProfileEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("asdffa");

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          "Seu Perfil",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: BlocProvider(
          builder: (_) => bloc,
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  BlocBuilder<UserProfileBloc, UserProfileState>(
                    builder: (context, state) {
                      if (state is LoadingUserProfile) {
                        widget.loading(context);
                      }
                      if (state is LoadedUserProfile) {
                        return SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                widget.profilePicture(),
                                widget.userProfileInfo(
                                    state.userProfile, context),
                                widget.buttonsBar(context)

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
