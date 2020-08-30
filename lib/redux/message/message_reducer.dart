import 'package:redux/redux.dart';
import 'package:flutter_redux_cascading_select/redux/message/message_state.dart';
import 'package:flutter_redux_cascading_select/redux/message/message_actions.dart';

final messageReducer = combineReducers<MessageState>([
  TypedReducer<MessageState,ShowMessage>(_showing),
  TypedReducer<MessageState,DismissMessage>(_dismiss),
]);

MessageState _showing(MessageState state, ShowMessage action){
  return state.copyWith(isShowing: true, messageCode: action.messageCode,
      messageDescription: action.messageDescription);
}

MessageState _dismiss(MessageState state, DismissMessage action){
  return state.copyWith(isShowing: false, messageCode: 0, messageDescription: "");
}