
import 'package:redux_mvvm_resfullapi_mtp/utils/constants.dart';

class InputUserNameAction {
  final String userName;

  InputUserNameAction(this.userName);
}

class InputPasswordAction {
  final String password;

  InputPasswordAction(this.password);
}

class ValidateLoginFields {
  final String userName;
  final String password;

  ValidateLoginFields(this.userName, this.password);
}

class LoginAction {
  final LoginStatus status;

  LoginAction(this.status);
}