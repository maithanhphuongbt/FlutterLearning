
import 'package:meta/meta.dart';
import 'package:flutter_tutorial_chain/constants/Gender.dart';
import 'package:flutter_tutorial_chain/constants/LoadingStatus.dart';

@immutable
class AuthState{

  final LoadingStatus loadingStatus;
  final String password;
  final String passwordError;
  final String retypePassword;
  final String retypePasswordError;
  final String email;
  final String emailError;
  final Gender gender;
  final String token;
  final String code;
  final String codeError;
  final bool loginStatus;

  AuthState({
    @required this.loadingStatus,
    @required this.password,
    @required this.passwordError,
    @required this.retypePassword,
    @required this.retypePasswordError,
    @required this.email,
    @required this.emailError,
    @required this.gender,
    @required this.token,
    @required this.code,
    @required this.codeError,
    @required this.loginStatus
  });

  factory AuthState.initial(){
    return new AuthState(
        loadingStatus: LoadingStatus.success,
        password: "",
        passwordError: "",
        retypePassword: "",
        retypePasswordError: "",
        email: "",
        emailError: "",
        gender: Gender.UNDEFINED,
        token: "",
        code: "",
        codeError: "",
        loginStatus: false);

  }

  AuthState copyWith({
    LoadingStatus loadingStatus,
    String password,
    String passwordError,
    String retypePassword,
    String retypePasswordError,
    String email,
    String emailError,
    Gender gender,
    String token,
    String code,
    String codeError,
    bool loginStatus,
  }){
    return new AuthState(
        loadingStatus: loadingStatus ?? this.loadingStatus,
        password: password ?? this.password,
        passwordError: passwordError ?? this.passwordError,
        retypePassword: retypePassword ?? this.retypePassword,
        retypePasswordError: retypePasswordError ?? this.retypePasswordError,
        email: email ?? this.email,
        emailError: emailError ?? this.emailError,
        gender: gender ?? this.gender,
        token: token ?? this.token,
        code: code ?? this.code,
        codeError: codeError ?? this.codeError,
        loginStatus: loginStatus ?? this.loginStatus,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is AuthState &&
              runtimeType == other.runtimeType &&
              loadingStatus == other.loadingStatus &&
              password == other.password &&
              passwordError == other.passwordError &&
              retypePassword == other.retypePassword &&
              retypePasswordError == other.retypePasswordError &&
              email == other.email &&
              emailError == other.emailError &&
              gender == other.gender &&
              token == other.token &&
              code == other.code &&
              codeError == other.codeError &&
              loginStatus == other.loginStatus;

  @override
  int get hashCode =>
      loadingStatus.hashCode ^
      password.hashCode ^
      passwordError.hashCode ^
      retypePassword.hashCode ^
      retypePasswordError.hashCode ^
      email.hashCode ^
      emailError.hashCode ^
      gender.hashCode ^
      token.hashCode ^
      code.hashCode ^
      codeError.hashCode ^
      loginStatus.hashCode;
}