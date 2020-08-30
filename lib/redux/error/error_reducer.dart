// Packages
import 'package:redux/redux.dart';

// Redux
import 'package:flutter_redux_cascading_select/redux/error/error_state.dart';
import 'package:flutter_redux_cascading_select/redux/error/error_actions.dart';

final errorReducer = combineReducers<ErrorState>([
  TypedReducer<ErrorState,ShowError>(_showing),
  TypedReducer<ErrorState,DismissError>(_dismiss),
]);

ErrorState _showing(ErrorState state, ShowError action){
  return state.copyWith(
      isShowing: true,
      errorCode: action.errorCode,
      errorDescription: action.errorDescription
  );
}

ErrorState _dismiss(ErrorState state, DismissError action){
  return state.copyWith(
      isShowing: false,
      errorCode: 0,
      errorDescription: null
  );
}