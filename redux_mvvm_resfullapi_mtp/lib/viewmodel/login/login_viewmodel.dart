import 'package:redux/redux.dart';
import 'package:redux_mvvm_resfullapi_mtp/redux/app/app_state.dart';
import 'package:redux_mvvm_resfullapi_mtp/redux/login/login_action.dart';
import 'package:redux_mvvm_resfullapi_mtp/utils/constants.dart';

class LoginViewModel {
  final ScreenState type;
  final LoadingStatus loadingStatus;
  final LoginStatus loginStatus;
  final String password;
  final String passwordError;
  final String userName;
  final String userNameError;

  final Function(String) inputUserName;
  final Function(String) inputPassword;
  final Function(String email, String password) login;

//  final Function navigateToRegistration;

  LoginViewModel(
      {this.type,
      this.loadingStatus,
      this.loginStatus,
      this.password,
      this.passwordError,
      this.userName,
      this.userNameError,
      this.inputUserName,
      this.inputPassword,
      this.login,});

  static LoginViewModel fromStore(Store<AppState> store) {
    return LoginViewModel(
        type: store.state.loginState.type,
        loadingStatus: store.state.loginState.loadingStatus,
        loginStatus: store.state.loginState.loginStatus,
        password: store.state.loginState.password,
        passwordError: store.state.loginState.passwordError,
        userName: store.state.loginState.userName,
        userNameError: store.state.loginState.userNameError,
        inputUserName: (userName) => store.dispatch(new InputUserNameAction(userName)),
        inputPassword: (password) => store.dispatch(new InputPasswordAction(password)),
        login: (userName, password) {
          store.dispatch(new ValidateLoginFields(userName, password));
        },
    );
  }
}
