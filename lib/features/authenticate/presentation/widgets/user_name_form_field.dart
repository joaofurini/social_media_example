import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserNameFormField extends StatefulWidget {
  final Function(String value) onUserNameChanged;

  const UserNameFormField({
    Key key,
    this.onUserNameChanged,
  }) : super(key: key);

  @override
  _UserNameFormFieldState createState() => _UserNameFormFieldState();
}

class _UserNameFormFieldState extends State<UserNameFormField> {
  final userNameController = TextEditingController();
  String inputStr;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: userNameController,
          decoration: InputDecoration(
              border: OutlineInputBorder(), hintText: 'Username'),
          onChanged: widget.onUserNameChanged,
        ),
        SizedBox(
          height: 10,
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
