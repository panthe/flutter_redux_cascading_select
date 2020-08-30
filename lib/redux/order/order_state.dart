// Packages
import 'package:flutter/material.dart';

// Redux
import 'package:flutter_redux_cascading_select/redux/order/category/order_category_state.dart';
import 'package:flutter_redux_cascading_select/redux/order/subcategory/order_subcategory_state.dart';
import 'package:flutter_redux_cascading_select/redux/order/product/order_product_state.dart';
import 'package:flutter_redux_cascading_select/redux/order/order_config.dart';

// Models
import 'package:flutter_redux_cascading_select/models/order/order_cascading_action.dart';

@immutable
class OrderState {
  final OrderCategoryState orderCategoryState;
  final OrderSubCategoryState orderSubCategoryState;
  final OrderProductState orderProductState;
  final List<OrderCascadingAction> orderCascadingActions;

  OrderState({
    this.orderCategoryState,
    this.orderSubCategoryState,
    this.orderProductState,
    this.orderCascadingActions
  });

  OrderState copyWith({
    OrderCategoryState orderCategoryState,
    OrderSubCategoryState orderSubCategoryState,
    OrderProductState orderProductState,
    List<OrderCascadingAction> orderCascadingActions
  }){
    return new OrderState(
      orderCategoryState: orderCategoryState ?? this.orderCategoryState,
      orderSubCategoryState: orderSubCategoryState ?? this.orderSubCategoryState,
      orderProductState: orderProductState ?? this.orderProductState,
      orderCascadingActions: orderCascadingActions ?? this.orderCascadingActions,
    );
  }

  factory OrderState.initial(){
    return new OrderState(
        orderCategoryState: OrderCategoryState.initial(),
        orderSubCategoryState: OrderSubCategoryState.initial(),
        orderProductState: OrderProductState.initial(),
        orderCascadingActions: orderCascadingActionList // this element never change
    );
  }
}