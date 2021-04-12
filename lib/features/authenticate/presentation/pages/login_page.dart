import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_example/core/theme/colab_app_theme.dart';
import 'package:social_media_example/features/authenticate/presentation/bloc/authentication_bloc.dart';
import 'package:social_media_example/features/authenticate/presentation/widgets/login_component.dart';
import 'package:social_media_example/features/feed/presentation/pages/feed_page.dart';
import 'package:social_media_example/injection_container.dart';

class LoginPage extends StatelessWidget with LoginComponent {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            SingleChildScrollView(
              child: _buildBody(context),
            )
          ],
        ),
      ),
    );
  }

  BlocProvider<AuthenticationBloc> _buildBody(BuildContext context) {
    String userName;
    String userPassword;

    return BlocProvider(
      builder: (_) => serviceLocator<AuthenticationBloc>(),
      child: Center(
        child: Padding(
          padding: ColabAppTheme.noAppBarPadding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BlocBuilder<AuthenticationBloc, AuthenticationState>(
                builder: (context, state) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      logo(),
                      userNameFormField(onUserNameChanged: (value) {
                        print('USERNAMEVALUE $value');
                      }),
                      passwordFormField(onPasswordChanged: (value) {
                        print('PASSWORDVALUE: $value');
                      }),
                      textForgetPassword(),
                      buttomFormField(onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FeedPage(),
                            ));
                      })
                    ],
                  );
                  // if (state is AuthenticationStateEmpty) {
                  //   return logo();
                  // } else if (state is AuthenticationStateLoaded) {
                  //   return Container();
                  // } else if (state is AuthenticationStateError) {
                  //   return MessageDisplay(
                  //     message: state.message,
                  //   );
                  // } else if (state is AuthenticationStateLoading) {
                  //   return LoadingWidget();
                  // }
                  // return Container(
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
