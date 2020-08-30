// Packages
import 'package:redux/redux.dart';

// Redux
import 'package:flutter_redux_cascading_select/redux/app/app_state.dart';
import 'package:flutter_redux_cascading_select/redux/error/error_actions.dart';
import 'package:flutter_redux_cascading_select/redux/order/product/order_product_actions.dart';
import 'package:flutter_redux_cascading_select/redux/order/subcategory/order_subcategory_actions.dart';
import 'package:flutter_redux_cascading_select/redux/order/category/order_category_middleware.dart';
import 'package:flutter_redux_cascading_select/redux/order/subcategory/order_subcategory_middleware.dart';
import 'package:flutter_redux_cascading_select/redux/order/product/order_product_middleware.dart';
import 'package:flutter_redux_cascading_select/redux/order/order_actions.dart';
import 'package:flutter_redux_cascading_select/redux/order/category/order_category_actions.dart';
import 'package:flutter_redux_cascading_select/redux/order/order_config.dart';

// Models
import 'package:flutter_redux_cascading_select/models/order/category.dart';
import 'package:flutter_redux_cascading_select/models/order/product.dart';
import 'package:flutter_redux_cascading_select/models/order/subcategory.dart';

List<Middleware<AppState>> createOrderMiddleware() {
  return [
    createOrderCascadingMiddleware(),
    createOrderCategoryMiddleware(),
    createOrderSubCategoryMiddleware(),
    createOrderProductMiddleware()
  ];
}

Middleware<AppState> createOrderCascadingMiddleware() {
  return (Store store, dynamic action, NextDispatcher next) async {

    if (action is SetOrderCascadingId) {
      try {
        if (action.id != 0) {
          print("Action id " + action.id.toString());
          print("Action obj type " + action.obj.toString());
          switch (action.obj) {
            case Category: {
              store.dispatch(SetOrderCategoryId(id: action.id));
              break;
            }

            case SubCategory: {
              store.dispatch(SetOrderSubCategoryId(id: action.id));
              break;
            }

            case Product: {
              store.dispatch(SetOrderProductId(id: action.id));
              break;
            }
          }
        } else {
          store.dispatch(ShowError(errorCode: 10, errorDescription: "Id can't be null!"));
        }
      } catch (error) {
        store.dispatch(ShowError(errorCode: error.hashCode, errorDescription: error.toString()));
      }
    }

    if (action is SetResetCascadingOrderFrom) {
      int indextoStart = orderCascadingActionList.indexWhere((el) => el.typeOfObject == action.obj);
      indextoStart++;
      print("indexToStart " + indextoStart.toString());
      for (int i=indextoStart; i<orderCascadingActionList.length; i++) {
        print("orderCascadingActionList[" + i.toString() + "] " + orderCascadingActionList[i].typeOfObject.toString());
        store.dispatch(orderCascadingActionList[i].action);
      }
    }

    next(action);
  };
}