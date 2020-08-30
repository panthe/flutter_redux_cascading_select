// Packages
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

// Redux
import 'package:flutter_redux_cascading_select/redux/keys.dart';
import 'package:flutter_redux_cascading_select/redux/app/app_state.dart';
import 'package:flutter_redux_cascading_select/redux/error/error_actions.dart';

Middleware<AppState> createErrorMiddleware() {
  //debugPrint('createErrorMiddleware');
  return (Store<AppState> store, dynamic action, NextDispatcher next) async {
    // //debugPrint("Action " + action.toString());

    if (action is ShowError) {
      //debugPrint('ShowError');

      Keys.scaffoldKey.currentState.showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content:new Text(action.errorDescription),
          duration: Duration(minutes: 1),
          action: new SnackBarAction(
            textColor: Colors.black,
            label: "OK",
            onPressed: () => store.dispatch(DismissError()),
          ),
        )
      );
    }



    if (action is DismissError){
      //debugPrint('DismissError');
      Keys.scaffoldKey.currentState.hideCurrentSnackBar();
    }

    next(action);
  };
}