// Packages
import 'package:redux/redux.dart';
import 'package:redux_logging/redux_logging.dart';

// Redux
import 'package:flutter_redux_cascading_select/redux/order/order_middleware.dart';
import 'package:flutter_redux_cascading_select/redux/app/app_state.dart';
import 'package:flutter_redux_cascading_select/redux/app/app_reducer.dart';
import 'package:flutter_redux_cascading_select/redux/error/error_middleware.dart';
import 'package:flutter_redux_cascading_select/redux/message/message_middleware.dart';

Store<AppState> createStore() {
  return Store(
      appReducer,
      initialState: AppState.initial(),
      middleware: []
        ..add(LoggingMiddleware.printer())
        ..add(createErrorMiddleware())
        ..add(createMessageMiddleware())
        ..addAll(createOrderMiddleware())
  );
}