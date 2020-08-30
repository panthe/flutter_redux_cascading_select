// Packages
import 'package:meta/meta.dart';

// Redux
import 'package:flutter_redux_cascading_select/redux/error/error_state.dart';
import 'package:flutter_redux_cascading_select/redux/message/message_state.dart';
import 'package:flutter_redux_cascading_select/redux/order/order_state.dart';

@immutable
class AppState {
  final ErrorState errorState;
  final MessageState messageState;
  final OrderState orderState;

  AppState({
    this.errorState,
    this.messageState,
    this.orderState
  });

  factory AppState.initial() {
    return AppState(
      errorState: ErrorState.initial(),
      messageState: MessageState.initial(),
      orderState: OrderState.initial(),
    );
  }

  AppState copyWith({
    ErrorState errorState,
    MessageState messageState,
    OrderState orderState,
  }) {
    return AppState(
      errorState: errorState,
      messageState: messageState,
      orderState: orderState,
    );
  }
}