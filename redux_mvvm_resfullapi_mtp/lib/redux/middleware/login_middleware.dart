import 'package:redux/redux.dart';
import 'package:redux_mvvm_resfullapi_mtp/models/login_request.dart';
import 'package:redux_mvvm_resfullapi_mtp/redux/app/app_state.dart';
import 'package:redux_mvvm_resfullapi_mtp/redux/login/login_action.dart';
import 'package:redux_mvvm_resfullapi_mtp/service/APIInterface.dart';
import 'package:redux_mvvm_resfullapi_mtp/utils/constants.dart';

class LoginMiddleware extends MiddlewareClass<AppState> {
  @override
  void call(Store<AppState> store, action, NextDispatcher next) {
    if (action is ValidateLoginFields) {
      APIInterface().loginRequest(new LoginRequest(action.userName, action.password)).then((result) {
        print(result);
        next(new LoginAction(
            result == LOGIN_SUCCESS ? LoginStatus.success : LoginStatus.fail));
      });
    }
    next(action);
  }
}
