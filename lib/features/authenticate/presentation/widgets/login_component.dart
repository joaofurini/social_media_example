import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:social_media_example/features/authenticate/presentation/widgets/logo.dart';
import 'package:social_media_example/features/authenticate/presentation/widgets/password_form_field.dart';
import 'package:social_media_example/features/authenticate/presentation/widgets/user_name_form_field.dart';

class LoginComponent {
  Widget logo() {
    return Logo();
  }

  Widget userNameFormField({
    void Function(String) onUserNameChanged,
  }) {
    return UserNameFormField(
      onUserNameChanged: onUserNameChanged,
    );
  }

  Widget textForgetPassword() {
    return Text('forget password');
  }

  Widget passwordFormField({
    void Function(String) onPasswordChanged,
  }) {
    return PasswordFormField(
      onUserNameChanged: onPasswordChanged,
    );
  }

  Widget buttomFormField({
    void Function() onPressed,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 100),
          child: RaisedButton(
            child: Text('Fazer login'),
            onPressed: onPressed,
          ),
        ),
      ],
    );
  }
}
