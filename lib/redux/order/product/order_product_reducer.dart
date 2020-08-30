// Packages
import 'package:redux/redux.dart';

// Redux
import 'package:flutter_redux_cascading_select/redux/order/product/order_product_state.dart';
import 'package:flutter_redux_cascading_select/redux/order/product/order_product_actions.dart';

final orderProductReducer = combineReducers<OrderProductState>([
  TypedReducer<OrderProductState, FetchingOrderProducts>(_fetchingProducts),
  TypedReducer<OrderProductState, SetOrderProducts>(_settingProducts),
  TypedReducer<OrderProductState, SetOrderProduct>(_settingProduct),
  TypedReducer<OrderProductState, ResetOrderProducts>(_reset),
]);

OrderProductState _fetchingProducts(OrderProductState state, FetchingOrderProducts action){
  return state.copyWith(
      isLoading: action.isLoading
  );
}

OrderProductState _settingProducts(OrderProductState state, SetOrderProducts action){
  return state.copyWith(
      products: action.products
  );
}

OrderProductState _settingProduct(OrderProductState state, SetOrderProduct action){
  return state.copyWith(
      product: action.product
  );
}

OrderProductState _reset(OrderProductState state, ResetOrderProducts action){
  return OrderProductState.initial();
}