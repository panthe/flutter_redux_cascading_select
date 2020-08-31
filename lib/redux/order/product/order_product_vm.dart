import 'package:flutter_redux_cascading_select/models/order/product.dart';
import 'package:flutter_redux_cascading_select/models/vm.dart';
import 'package:flutter_redux_cascading_select/redux/app/app_state.dart';
import 'package:redux/redux.dart';

class OrderProductVM extends VM<Product>{
  Product state;

  OrderProductVM({this.state});

  static OrderProductVM fromStore(Store<AppState> store) {
    return OrderProductVM(
        state: store.state.orderState.orderProductState.product
    );
  }
}