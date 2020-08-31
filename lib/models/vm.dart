import 'package:flutter_redux_cascading_select/redux/app/app_state.dart';
import 'package:flutter_redux_cascading_select/redux/order/category/order_category_vm.dart';
import 'package:redux/redux.dart';

abstract class VM<T> {
  T state;

  VM({this.state});

  static VM fromStore(Store<AppState> store) {}
}