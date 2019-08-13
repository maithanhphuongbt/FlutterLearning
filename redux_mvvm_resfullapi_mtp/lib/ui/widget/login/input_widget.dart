import 'package:flutter/material.dart';
import 'package:redux_mvvm_resfullapi_mtp/viewmodel/login/login_viewmodel.dart';

class InputWidget extends StatelessWidget {
  final double topRight;
  final double bottomRight;
  final LoginViewModel viewModel;
  InputWidget(this.topRight, this.bottomRight, this.viewModel);

  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: EdgeInsets.only(right: 40, bottom: 30, left: 40),
      child: Container(
        width: MediaQuery
            .of(context)
            .size
            .width - 40,
        child: Material(
            elevation: 10,
            color: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(topRight),
                    topRight: Radius.circular(topRight))),
            child: new Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(
                      left: 40, right: 20, top: 10, bottom: 10),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(width: 1, color: Colors.grey),
                    ),
                  ),
                  child: TextField(
                    onChanged: (userName){
                      viewModel.inputUserName(userName);
                      print(userName);
                    },
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "User name",
                        hintStyle: TextStyle(
                            color: Color(0xFFE1E1E1), fontSize: 14)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: 40, right: 20, top: 10, bottom: 10),
                  child: TextField(
                    obscureText: true,
                    onChanged: (password) {
                      viewModel.inputPassword(password);
                      print(password);
                    },
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Pass word",
                        hintStyle: TextStyle(
                            color: Color(0xFFE1E1E1), fontSize: 14)),
                  ),
                ),
              ],
            )
        ),
      ),
    );
  }
}
