// Packages
import 'package:redux/redux.dart';

// Redux
import 'package:flutter_redux_cascading_select/redux/app/app_state.dart';
import 'package:flutter_redux_cascading_select/redux/error/error_actions.dart';
import 'package:flutter_redux_cascading_select/redux/order/product/order_product_actions.dart';

// Models
import 'package:flutter_redux_cascading_select/models/order/product.dart';

// Mock Data
import 'package:flutter_redux_cascading_select/mock_data/products_mock_data.dart';

Middleware<AppState> createOrderProductMiddleware() {
  return (Store store, dynamic action, NextDispatcher next) async {

    if (action is FetchOrderProducts) {
      store.dispatch(FetchingOrderProducts(isLoading: true));
      try {
        List<Product> products = productsMockData.where((el) => el.idSubCategory == action.idSubCategory).toList(growable: false);
        if (products != null) {
          store.dispatch(SetOrderProducts(products: products));
        } else {
          store.dispatch(ShowError(errorCode: 5, errorDescription: "Products not found!"));
        }
      } catch (error) {
        store.dispatch(ShowError(errorCode: error.hashCode, errorDescription: error.toString()));
      }
      store.dispatch(FetchingOrderProducts(isLoading: false));
    }

    if (action is SetOrderProductId) {
      try {
        if (action.id != 0) {
          Product product = store.state.orderState.orderProductState.products.firstWhere((element) => element.id == action.id);
          store.dispatch(SetOrderProduct(product: product));
        } else {
          store.dispatch(ShowError(errorCode: 2, errorDescription: "Product Id can't be null!"));
        }
      } catch (error) {
        store.dispatch(ShowError(errorCode: error.hashCode, errorDescription: error.toString()));
      }
    }

    next(action);
  };
}
