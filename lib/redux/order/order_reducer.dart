// Redux
import 'package:flutter_redux_cascading_select/redux/order/order_state.dart';
import 'package:flutter_redux_cascading_select/redux/order/category/order_category_reducer.dart';
import 'package:flutter_redux_cascading_select/redux/order/subcategory/order_subcategory_reducer.dart';
import 'package:flutter_redux_cascading_select/redux/order/product/order_product_reducer.dart';

OrderState orderReducer(state, action) {
  return OrderState(
    orderCategoryState: orderCategoryReducer(state.orderCategoryState,action),
    orderSubCategoryState: orderSubCategoryReducer(state.orderSubCategoryState,action),
    orderProductState: orderProductReducer(state.orderProductState,action),
  );
}