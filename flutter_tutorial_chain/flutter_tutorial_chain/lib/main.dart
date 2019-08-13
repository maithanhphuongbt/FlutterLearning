import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tutorial_chain/redux/Store.dart';
import 'package:flutter_tutorial_chain/redux/app/AppState.dart';
import 'package:flutter_tutorial_chain/reduxandfirebase/ReduxFirebase.dart';
import 'package:flutter_tutorial_chain/login/view/Login.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

// One simple action: Increment
enum Actions { Increment }

// The reducer, which takes the previous count and increments it in response
// to an Increment action.
int counterReducer(int state, dynamic action) {
  if (action == Actions.Increment) {
    return state + 1;
  }

  return state;
}

void main() async {
  // Create your store as a final variable in a base Widget. This works better
  // with Hot Reload than creating it directly in the `build` function.
//  final store = new Store<int>(counterReducer, initialState: 0);
//
//  runApp(new MyApp(
//    title: 'Flutter Redux Demo',
//    store: store,
//  ));

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
  var store = await createStore();
  runApp(new MyApp(
      title: 'Flutter Redux Demo',
      store: store
  ));
}

class MyApp extends StatelessWidget {
  final Store<AppState> store;
  final String title;

  MyApp({Key key, this.store, this.title}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new StoreProvider(
        store: store,
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: new Scaffold(
            appBar: null,
            body: MyHomePage(title: 'Flutter Demo Home Page'),
//            floatingActionButton: new StoreConnector<int, VoidCallback>(
//              converter: (store) {
//                // Return a `VoidCallback`, which is a fancy name for a function
//                // with no parameters. It only dispatches an Increment action.
//                return () => store.dispatch(Actions.Increment);
//              },
//              builder: (context, callback) {
//                return new FloatingActionButton(
//                  // Attach the `callback` to the `onPressed` attribute
//                  onPressed: callback,
//                  tooltip: 'Increment',
//                  child: new Icon(Icons.add),
//                );
//              },
//            ),
          ),
        ));
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            // Here we take the value from the MyHomePage object that was created by
            // the App.build method, and use it to set our appbar title.
            title: new Text(widget.title)
          ),
          body: ListView(
                padding: const EdgeInsets.all(8.0),
                children: <Widget>[
                  Card(
                    child: ListTile(
                      leading: FlutterLogo(size: 56.0),
                      title: Text('Login with firebase'),
                      subtitle: Text('Here is a second line'),
                      trailing: Icon(Icons.more_vert),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => new Login()));
                      },
                    ),
                  ),
                  Card(
                    child: ListTile(
                      leading: FlutterLogo(size: 56.0),
                      title: Text('Redux + Firebase'),
                      subtitle: Text('Here is a second line'),
                      trailing: Icon(Icons.more_vert),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => new ReduxFirebase()));
                      },
                    ),
                  ),
                ],
              )// Th // This trailing comma makes auto-formatting nicer for build methods.
          ),
    );
  }
}
