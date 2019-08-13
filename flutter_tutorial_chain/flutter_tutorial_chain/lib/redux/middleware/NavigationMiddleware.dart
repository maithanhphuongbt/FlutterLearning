

import 'package:flutter_tutorial_chain/constants/Keys.dart';
import 'package:flutter_tutorial_chain/redux/app/AppState.dart';
import 'package:flutter_tutorial_chain/redux/auth/AuthAction.dart';
import 'package:redux/redux.dart';

class NavigationMiddleware extends MiddlewareClass<AppState>{
  @override
  void call(Store<AppState> store, dynamic action, NextDispatcher next) {
    if(action is NavigateToRegistrationAction){
      Keys.navKey.currentState.pushNamed("/signup");
    }
    next(action);
  }
}