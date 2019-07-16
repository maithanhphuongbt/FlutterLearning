import 'package:meta/meta.dart';
import 'package:redux_mvvm_resfullapi_mtp/utils/constants.dart';

@immutable
class LoginState {
  final ScreenState type;
  final LoadingStatus loadingStatus;
  final LoginStatus loginStatus;
  final String password;
  final String passwordError;
  final String userName;
  final String userNameError;

  LoginState(
      {this.type,
      this.loadingStatus,
      this.loginStatus,
      this.password,
      this.passwordError,
      this.userName,
      this.userNameError});

  LoginState copyWith({
    ScreenState type,
    LoadingStatus loadingStatus,
    LoginStatus loginStatus,
    String password,
    String passwordError,
    String userName,
    String userNameError,
  }) {
    return new LoginState(
      type: type ?? this.type,
      loadingStatus: loadingStatus ?? this.loadingStatus,
      loginStatus: loginStatus ?? this.loginStatus,
      password: password ?? this.password,
      passwordError: passwordError ?? this.passwordError,
      userName: userName ?? this.userName,
    );
  }

  factory LoginState.initial() {
    return new LoginState(
        type: ScreenState.WELCOME,
        loadingStatus: LoadingStatus.success,
        loginStatus: LoginStatus.fail,
        password: "",
        passwordError: "",
        userName: "",
        userNameError: "");
  }
}
