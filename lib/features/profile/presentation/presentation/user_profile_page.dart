import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:social_media_example/features/profile/presentation/bloc/user_profile_bloc.dart';
import 'package:social_media_example/injection_container.dart';

class UserProfilePage extends StatefulWidget {
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
                      if (state is LoadedUserProfile) {
                        return SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Center(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child: Image.asset(
                                      "assets/imagens/perfil.jpg",
                                      height: 150,
                                      width: 150,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Divider(
                                  thickness: 1,
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text("Nome: "),
                                        Text("${state.userProfile.name}"),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text("Email: "),
                                        Text("${state.userProfile.email}"),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text("Idade : "),
                                        Text("${state.userProfile.idade}"),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 4,
                                ),

                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    FlatButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text("Voltar"),
                                    ),
                                    RaisedButton(
                                      onPressed: () {},
                                      child: Text("Editar perfil"),
                                    ),
                                  ],
                                )

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
