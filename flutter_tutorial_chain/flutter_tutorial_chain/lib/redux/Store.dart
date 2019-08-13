import 'dart:async';
import 'package:flutter_tutorial_chain/redux/middleware/LocalStorageMiddleware.dart';
import 'package:flutter_tutorial_chain/redux/middleware/NavigationMiddleware.dart';
import 'package:flutter_tutorial_chain/redux/middleware/ValidationMiddleware.dart';
import 'package:flutter_tutorial_chain/redux/app/AppReducer.dart';
import 'package:redux/redux.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:redux_logging/redux_logging.dart';
import 'app/AppState.dart';

Future<Store<AppState>> createStore() async {
  var prefs = await SharedPreferences.getInstance();
  return Store(
    appReducer,
    initialState: AppState.initial(),
    middleware: [
      ValidationMiddleware(),
      LoggingMiddleware.printer(),
      LocalStorageMiddleware(prefs),
      NavigationMiddleware()
    ],
  );
}