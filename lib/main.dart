// Packages
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

// Redux
import 'package:flutter_redux_cascading_select/redux/keys.dart';
import 'package:flutter_redux_cascading_select/redux/app/app_state.dart';
import 'package:flutter_redux_cascading_select/redux/store.dart';

// UI
import 'package:flutter_redux_cascading_select/ui/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Store<AppState> store = createStore();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Redux Cascading Selections',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: StoreProvider<AppState>(
            store: store,
            child: Scaffold(
            key: Keys.scaffoldKey,
            appBar: AppBar(
              title: Text("Flutter Redux Cascading Selection Example"),
            ),
            body: Home()
        )
      )
    );
  }
}