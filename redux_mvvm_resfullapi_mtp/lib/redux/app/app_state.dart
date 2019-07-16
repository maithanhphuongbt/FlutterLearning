import 'package:meta/meta.dart';
import 'package:redux_mvvm_resfullapi_mtp/redux/login/login_state.dart';

@immutable
class AppState {
  final LoginState loginState;

  AppState({this.loginState});

  factory AppState.initial(){
    return AppState(
        loginState: LoginState.initial(),
    );
  }

  AppState copyWidth({
    LoginState loginSate,
  }) {
    return new AppState(
      loginState: loginSate ?? this.loginState,
    );
  }
}
