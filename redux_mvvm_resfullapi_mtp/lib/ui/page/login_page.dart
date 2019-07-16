import 'package:flutter/material.dart';
import 'package:redux_mvvm_resfullapi_mtp/ui/widget/login/background.dart';
import 'package:redux_mvvm_resfullapi_mtp/ui/widget/login/forground.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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


