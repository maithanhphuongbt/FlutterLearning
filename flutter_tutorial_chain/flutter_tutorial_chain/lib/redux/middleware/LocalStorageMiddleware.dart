import 'package:flutter_tutorial_chain/redux/app/AppState.dart';
import 'package:flutter_tutorial_chain/redux/auth/AuthAction.dart';
import 'package:redux/redux.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageMiddleware extends MiddlewareClass<AppState>{

  final SharedPreferences preferences;

  LocalStorageMiddleware(this.preferences);

  @override
  void call(Store<AppState> store, dynamic action, NextDispatcher next) {
    next(action);
    if(action is CheckTokenAction){
      var token = preferences.getString("TOKEN");
      if(token!=null && token.isNotEmpty){
        action.hasTokenCallback();
      }else{
        action.noTokenCallback();
      }
    }
  }
}