import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_mvvm_resfullapi_mtp/redux/app/app_state.dart';
import 'package:redux_mvvm_resfullapi_mtp/redux/store.dart';
import 'package:redux_mvvm_resfullapi_mtp/ui/page/home_page.dart';
import 'package:redux_mvvm_resfullapi_mtp/ui/page/login_page.dart';
import 'package:redux_mvvm_resfullapi_mtp/utils/keys.dart';

void main() async {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
  var store = await createStore();
  runApp (new App(
    store: store,
  ));
}

class App extends StatefulWidget {
  final Store<AppState> store;
  const App({Key key, this.store}) : super(key: key);


  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return new StoreProvider(
        store: widget.store,
        child: new MaterialApp(
          theme: new ThemeData(
            primaryColor: Colors.grey.shade900,
            primaryColorLight: Colors.grey.shade800,
            primaryColorDark: Colors.black,
            scaffoldBackgroundColor: Colors.grey.shade800,
            textTheme: TextTheme(
              body1: TextStyle(color: Colors.white),
              display1: TextStyle(color: Colors.white),
              title: TextStyle(color: Colors.white),
            ),
            iconTheme: IconThemeData(color: Colors.white),
            accentColor: Colors.yellow[500],
          ),
          home: LoginPage(),
          navigatorKey: Keys.navKey,
//          navigatorObservers: [routeObserver],
          routes: <String, WidgetBuilder> {
            "/home": (BuildContext context) => new HomePage(),
            "/login": (BuildContext context) => new LoginPage(),
          },
        )
    );
  }
}
