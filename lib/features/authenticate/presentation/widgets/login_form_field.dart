import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginFormField extends StatefulWidget {
  final Function(String value) onLoginChanged;
  final Function(String value) onPasswordChanged;
  const LoginFormField({
    Key key,
    this.onLoginChanged,
    this.onPasswordChanged,
  }) : super(key: key);

  @override
  _LoginFormFieldState createState() => _LoginFormFieldState();
}

class _LoginFormFieldState extends State<LoginFormField> {
  final userNameController = TextEditingController();
  final userPasswordController = TextEditingController();
  String inputStr;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: userNameController,
          decoration: InputDecoration(
              border: OutlineInputBorder(), hintText: 'Username'),
          onChanged: widget.onLoginChanged,
        ),
        SizedBox(
          height: 10,
        ),
        TextField(
          controller: userPasswordController,
          decoration: InputDecoration(
              border: OutlineInputBorder(), hintText: 'Input a number'),
          onChanged: widget.onPasswordChanged,
        ),
      ],
    );
  }

  // void dispatchConcrete() {
  //   controller.clear();
  //   BlocProvider.of<NumberTriviaBloc>(context)
  //       .dispatch(GetTriviaForConcreteNumber(inputStr));
  // }

  // void dispatchRandom() {
  //   controller.clear();
  //   BlocProvider.of<NumberTriviaBloc>(context)
  //       .dispatch(GetTriviaForRandomNumber());
  // }
}
