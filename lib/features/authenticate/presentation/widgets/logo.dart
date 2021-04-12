import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40, bottom: 60),
      height: MediaQuery.of(context).size.height / 6,
      width: MediaQuery.of(context).size.height / 6,
      child: Image.asset("assets/imagens/logo.png"),
    );
  }
}
