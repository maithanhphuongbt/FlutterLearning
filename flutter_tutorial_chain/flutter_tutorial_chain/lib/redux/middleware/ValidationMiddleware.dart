import 'package:flutter_tutorial_chain/constants/Constants.dart';
import 'package:flutter_tutorial_chain/constants/LoadingStatus.dart';
import 'package:flutter_tutorial_chain/constants/Screen.dart';
import 'package:flutter_tutorial_chain/login/model/LoginRequest.dart';
import 'package:flutter_tutorial_chain/login/model/LoginResponse.dart';
import 'package:flutter_tutorial_chain/redux/app/AppState.dart';
import 'package:flutter_tutorial_chain/redux/auth/AuthAction.dart';
import 'package:flutter_tutorial_chain/service/APIInterface.dart';
import 'package:redux/redux.dart';
import 'package:toast/toast.dart';

class ValidationMiddleware extends MiddlewareClass<AppState>{

  final String emailPattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  @override
  void call(Store<AppState> store, dynamic action, NextDispatcher next) {
    if(action is ValidateEmailAction){
      validateEmail(action.screen,action.email, next);
      print("ValidateEmailAction in ValidationMiddleware class");
    }

    if(action is ValidatePasswordAction){
      validatePassword(action.screen,action.password, next);
    }

    if(action is ValidatePasswordMatchAction){
      validatePassMatch(action.screen,action.password, action.confirmPassword, next);
    }

    if(action is ValidateCodeAction){
      if(isNumeric(action.code) && action.code.length>=6){
        next(new CodeErrorAction(""));
      }else{
        next(CodeErrorAction(code_error));
      }
    }

    if(action is ValidateLoginFields){
      validateEmail(Screen.SIGNIN,action.email, next);
      validatePassword(Screen.SIGNIN,action.password, next);
//      APIInterface().getUsers();
//      RegExp exp = new RegExp(emailPattern);
//      if(!exp.hasMatch(action.email) || action.password.length<6){
//        next(ChangeLoadingStatusAction(LoadingStatus.error));
//      }else{
//        next(new SignInAction(new LoginRequest(action.email,action.password)));
//        // ignore: unnecessary_statements
      APIInterface().loginRequest(new LoginRequest(action.email,action.password)).then((result) {
          print(result);
          next(new SignInAction(result == login_success));
      });
    }
    if(action is ValidateSignUpFieldsAction){
      validateEmail(Screen.SIGNUP,action.request.email, next);
      validatePassword(Screen.SIGNUP,action.request.password, next);
      validatePassMatch(Screen.SIGNUP,action.request.password, action.request.retypePassword, next);
      RegExp exp = new RegExp(emailPattern);
      if(!exp.hasMatch(action.request.email) || action.request.password.length<6 || action.request.password != action.request.retypePassword){
        next(ChangeLoadingStatusAction(LoadingStatus.error));
      }else{
        next(new SignUpAction(action.request));
      }
    }
    if (action is PasswordErrorAction) {
      print("PasswordErrorAction in ValidationMiddleware class");
    }
    next(action);
  }

  void validatePassMatch(Screen screen, String password, String confirmPassword, NextDispatcher next) {
    if(password != confirmPassword){
      next(new RetypePasswordErrorAction(password_match_error,screen));
    }else{
      next(new RetypePasswordErrorAction("",screen));
    }
  }

  void validatePassword(Screen screen, String password, NextDispatcher next) {
    if(password.length<6){
      next(new PasswordErrorAction(password_error,screen));
    }else{
      next(new PasswordErrorAction("",screen));
    }
  }

  void validateEmail(Screen screen, String email, NextDispatcher next) {
    RegExp exp = new RegExp(emailPattern);
    if(!exp.hasMatch(email)){
      next(new EmailErrorAction(email_error,screen));
    }else{
      next(new EmailErrorAction("",screen));
    }
  }

  bool isNumeric(String s) {
    if(s == null) {
      return false;
    }
    // ignore: deprecated_member_use
    return double.parse(s, (e) => null) != null;
  }
}

  String getLoginResponse(String userName, String password) {

}