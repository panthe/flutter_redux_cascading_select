//Redux
import 'package:flutter_redux_cascading_select/redux/app/app_state.dart';
import 'package:flutter_redux_cascading_select/redux/error/error_reducer.dart';
import 'package:flutter_redux_cascading_select/redux/message/message_reducer.dart';
import 'package:flutter_redux_cascading_select/redux/order/order_reducer.dart';

AppState appReducer(state, action) {
  return new AppState(
    errorState: errorReducer(state.errorState,action),
    messageState: messageReducer(state.messageState,action),
    orderState: orderReducer(state.orderState, action)
  );
}