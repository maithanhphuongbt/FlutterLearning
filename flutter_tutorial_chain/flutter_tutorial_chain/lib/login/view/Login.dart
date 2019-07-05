import 'package:flutter/material.dart';
import 'package:flutter_tutorial_chain/login/view/Background.dart';
import 'package:flutter_tutorial_chain/login/view/ForceGround.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Colors.white,
        body: Stack(
          children: <Widget>[
            Background(),
            ForceGround(),
          ],
        )
    );
  }
}

