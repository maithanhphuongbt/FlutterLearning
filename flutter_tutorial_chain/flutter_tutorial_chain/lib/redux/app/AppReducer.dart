
import 'AppState.dart';
import 'package:flutter_tutorial_chain/redux/auth/AuthReducer.dart';
import 'package:flutter_tutorial_chain/redux/signin/SingInReducer.dart';

AppState appReducer(AppState state, dynamic action) =>
    new AppState(
        authState: authReducer(state.authState,action),
        signInState: signinReducer(state.signInState,action)
    );