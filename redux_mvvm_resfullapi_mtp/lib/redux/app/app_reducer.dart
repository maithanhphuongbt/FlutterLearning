import 'package:redux_mvvm_resfullapi_mtp/redux/login/login_reducer.dart';

import 'app_state.dart';

AppState appReducer(AppState state, dynamic action) => new AppState(
      loginState: loginReducer(state.loginState, action),
    );
