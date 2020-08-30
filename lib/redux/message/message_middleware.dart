// Packages
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

// Redux
import 'package:flutter_redux_cascading_select/redux/keys.dart';
import 'package:flutter_redux_cascading_select/redux/app/app_state.dart';
import 'package:flutter_redux_cascading_select/redux/message/message_actions.dart';

Middleware<AppState> createMessageMiddleware() {
  //debugPrint('createMessageMiddleware');
  return (Store<AppState> store, dynamic action, NextDispatcher next) async {
    // //debugPrint("Action " + action.toString());

    if (action is ShowMessage) {
      //debugPrint('ShowMessage');

      Keys.scaffoldKey.currentState.showSnackBar(
          SnackBar(
            backgroundColor: Colors.green,
            content:new Text(action.messageDescription),
            duration: Duration(minutes: 1),
            action: new SnackBarAction(
              textColor: Colors.black,
              label: "OK",
              onPressed: () => store.dispatch(DismissMessage()),
            ),
          )
      );

    }

    if (action is DismissMessage){
      Keys.scaffoldKey.currentState.hideCurrentSnackBar();
    }

    next(action);
  };
}