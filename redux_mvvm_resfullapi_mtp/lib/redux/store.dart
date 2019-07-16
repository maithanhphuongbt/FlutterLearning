
import 'package:redux/redux.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app/app_state.dart';
import 'middleware/login_middleware.dart';
import 'app/app_reducer.dart';

Future<Store<AppState>> createStore() async {
  var prefs = await SharedPreferences.getInstance();
  return Store(
    appReducer,
    initialState: AppState.initial(),
    middleware: [
      LoginMiddleware()
    ]
  );
}