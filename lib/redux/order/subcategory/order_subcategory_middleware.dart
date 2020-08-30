// Redux
import 'package:redux/redux.dart';
import 'package:flutter_redux_cascading_select/redux/app/app_state.dart';
import 'package:flutter_redux_cascading_select/redux/error/error_actions.dart';
import 'package:flutter_redux_cascading_select/redux/order/subcategory/order_subcategory_actions.dart';
import 'package:flutter_redux_cascading_select/redux/order/product/order_product_actions.dart';

// Models
import 'package:flutter_redux_cascading_select/models/order/subcategory.dart';

// Mock Data
import 'package:flutter_redux_cascading_select/mock_data/subcategories_mock_data.dart';

Middleware<AppState> createOrderSubCategoryMiddleware() {
  return (Store store, dynamic action, NextDispatcher next) async {

    if (action is FetchOrderSubCategories) {
      store.dispatch(FetchingOrderSubCategories(isLoading: true));
      try {
        List<SubCategory> subCategories = subCategoriesMockData.where((el) => el.idCategory == action.idCategory).toList(growable: false);
        if (subCategories != null) {
          store.dispatch(SetOrderSubCategories(subCategories: subCategories));
        } else {
          store.dispatch(ShowError(errorCode: 3, errorDescription: "SubCategories not found!"));
        }
      } catch (error) {
        store.dispatch(ShowError(errorCode: error.hashCode, errorDescription: error.toString()));
      }
      store.dispatch(FetchingOrderSubCategories(isLoading: false));
    }

    if (action is SetOrderSubCategoryId) {
      try {
        if (action.id != 0) {
          SubCategory subCategory = store.state.orderState.orderSubCategoryState.subCategories.firstWhere((element) => element.id == action.id);
          store.dispatch(SetOrderSubCategory(subCategory: subCategory));
          store.dispatch(FetchOrderProducts(idSubCategory: action.id));
        } else {
          store.dispatch(ShowError(errorCode: 4, errorDescription: "SubCategory Id can't be null!"));
        }
      } catch (error) {
        store.dispatch(ShowError(errorCode: error.hashCode, errorDescription: error.toString()));
      }
    }

    next(action);
  };
}
