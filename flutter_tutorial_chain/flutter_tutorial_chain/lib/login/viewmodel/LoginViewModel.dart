import 'package:flutter_tutorial_chain/constants/LoadingStatus.dart';
import 'package:flutter_tutorial_chain/constants/Screen.dart';
import 'package:flutter_tutorial_chain/constants/ScreenState.dart';
import 'package:flutter_tutorial_chain/login/model/LoginRequest.dart';
import 'package:flutter_tutorial_chain/login/model/LoginResponse.dart';
import 'package:flutter_tutorial_chain/redux/app/AppState.dart';
import 'package:flutter_tutorial_chain/redux/auth/AuthAction.dart';
import 'package:flutter_tutorial_chain/service/APIInterface.dart';
import 'package:redux/redux.dart';

class LoginViewModel{

  LoginResponse loginResponse;
  final LoadingStatus status;
  final ScreenState type;
  final String password;
  final String passwordError;
  final String email;
  final String emailError;
  final bool loginStatus;

  final Function(String) validateEmail;
  final Function(String) validatePassword;
  final Function(String email, String password) login;
  final Function clearError;
  final Function navigateToRegistration;

  LoginViewModel({this.status,
    this.type,
    this.password,
    this.passwordError,
    this.email,
    this.emailError,
    this.loginStatus,
    this.validateEmail,
    this.validatePassword,
    this.login,
    this.clearError,
    this.navigateToRegistration});


  static LoginViewModel fromStore(Store<AppState> store){
    return LoginViewModel(
        status: store.state.signInState.loadingStatus,
        type: store.state.signInState.type,
        email: store.state.signInState.email,
        emailError: store.state.signInState.emailError,
        loginStatus: store.state.authState.loginStatus,
        password:store.state.signInState.password,
        passwordError: store.state.signInState.passwordError,
        validateEmail: (email) => store.dispatch(new ValidateEmailAction(email,Screen.SIGNIN)),
        validatePassword: (password) =>store.dispatch(new ValidatePasswordAction(password,Screen.SIGNIN)),
        login: (email, password) {
          store.dispatch(new ValidateLoginFields(email, password));
        },
        clearError: () => store.dispatch(new ClearErrorsAction()),
        navigateToRegistration: () => store.dispatch(new NavigateToRegistrationAction())
    );
  }
}