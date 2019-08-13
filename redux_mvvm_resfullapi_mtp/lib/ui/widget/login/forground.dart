import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_mvvm_resfullapi_mtp/redux/app/app_state.dart';
import 'package:redux_mvvm_resfullapi_mtp/utils/colors.dart';
import 'package:redux_mvvm_resfullapi_mtp/utils/constants.dart';
import 'package:redux_mvvm_resfullapi_mtp/viewmodel/login/login_viewmodel.dart';

import 'input_widget.dart';

class ForceGround extends StatefulWidget {
  @override
  _ForceGroundState createState() => _ForceGroundState();
}

class _ForceGroundState extends State<ForceGround> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding:
          EdgeInsets.only(top: MediaQuery.of(context).size.height / 2.3),
        ),
        StoreConnector<AppState, LoginViewModel>(
            converter: (store) => LoginViewModel.fromStore(store),
            builder: (_,viewModel) =>
                Column(
                  children: <Widget>[
//                    viewModel.loginStatus == LoginStatus.success?
//                    new Container(
//                      child: new TextField(
//                        maxLines: 1,
//                        style: Theme.of(context).textTheme.title,
//                        decoration: new InputDecoration(
//                            labelText: "Observation",
//                            isDense: true
//                        ),
//                      ),
//                    ): new Container(),
//                    viewModel.loginStatus == LoginStatus.success?
//                    viewModel.navigateToRegistration():
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Stack(
                          alignment: Alignment.bottomRight,
                          children: <Widget>[
                            InputWidget(30.0, 0.0, viewModel),
                            Padding(
                                padding: EdgeInsets.only(right: 50),
                                child: Row(
                                  children: <Widget>[
                                    Expanded(child: Container()),
                                    Container(
                                        padding: EdgeInsets.all(10),
                                        decoration: ShapeDecoration(
                                          shape: CircleBorder(),
                                          gradient: LinearGradient(
                                              colors: loginEmail,
                                              begin: Alignment.topLeft,
                                              end: Alignment.bottomRight),
                                        ),
                                        child: GestureDetector(
                                          onTap: (){
                                            viewModel.login(viewModel.userName,viewModel.password);
                                          },
                                          child: ImageIcon(
                                            AssetImage("images/ic_forward.png"),
                                            size: 40,
                                            color: Colors.white,
                                          ),
                                        )
                                    ),
                                  ],
                                ))
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 50),
                    ),
                  ],
                )
        )
      ],
    );
  }
}
