import 'package:redux/redux.dart';

import 'login_action.dart';
import 'login_state.dart';

final loginReducer = combineReducers<LoginState>([
  TypedReducer<LoginState, InputUserNameAction>(_inputUserNameAction),
  TypedReducer<LoginState, InputPasswordAction>(_inputPasswordAction),
  TypedReducer<LoginState, ValidateLoginFields>(_validateLoginFieldsAction),
  TypedReducer<LoginState, LoginAction>(_loginAction),
]);

LoginState _inputUserNameAction(LoginState state, InputUserNameAction action) =>
    state.copyWith(userName: action.userName);

LoginState _inputPasswordAction(LoginState state, InputPasswordAction action) =>
    state.copyWith(password: action.password);

LoginState _validateLoginFieldsAction(LoginState state, ValidateLoginFields action) => state;

LoginState _loginAction(LoginState state, LoginAction action) =>
    state.copyWith(loginStatus: action.status);
