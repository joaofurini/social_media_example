import 'package:flutter/material.dart';

import 'package:social_media_example/features/profile/domain/entities/user_profile.dart';

class UserProfilePageComponent {
  Widget profilePicture() {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Image.asset(
            "assets/imagens/perfil.jpg",
            height: 150,
            width: 150,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Divider(
          thickness: 1,
        ),
      ],
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

  Widget userProfileInfo(UserProfile userInfo, BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height / 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Text("Nome: "),
                Text("${userInfo.name}"),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text("Email: "),
                Text("${userInfo.email}"),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text("Idade : "),
                Text("${userInfo.idade}"),
              ],
            ),
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 4,
        )
      ],
    );
  }

  Widget buttonsBar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
    );
  }
}
