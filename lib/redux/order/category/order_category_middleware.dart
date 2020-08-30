// Packages
import 'package:redux/redux.dart';

// Redux
import 'package:flutter_redux_cascading_select/redux/app/app_state.dart';
import 'package:flutter_redux_cascading_select/redux/error/error_actions.dart';
import 'package:flutter_redux_cascading_select/redux/order/category/order_category_actions.dart';
import 'package:flutter_redux_cascading_select/redux/order/subcategory/order_subcategory_actions.dart';

// Models
import 'package:flutter_redux_cascading_select/models/order/category.dart';

// Mock Data
import 'package:flutter_redux_cascading_select/mock_data/categories_mock_data.dart';

Middleware<AppState> createOrderCategoryMiddleware() {
  return (Store store, dynamic action, NextDispatcher next) async {

    if (action is FetchOrderCategories) {
      store.dispatch(FetchingOrderCategories(isLoading: true));
      try {
        List<Category> categories = categoriesMockData;
        if (categories != null) {
          store.dispatch(SetOrderCategories(categories: categories));
        } else {
          store.dispatch(ShowError(errorCode: 1, errorDescription: "Categories not found!"));
        }
      } catch (error) {
        store.dispatch(ShowError(errorCode: error.hashCode, errorDescription: error.toString()));
      }
      store.dispatch(FetchingOrderCategories(isLoading: false));
    }

    if (action is SetOrderCategoryId) {
      try {
        if (action.id != 0) {
          Category category = store.state.orderState.orderCategoryState.categories.firstWhere((element) => element.id == action.id);
          store.dispatch(SetOrderCategory(category: category));
          store.dispatch(FetchOrderSubCategories(idCategory: action.id));
        } else {
          store.dispatch(ShowError(errorCode: 2, errorDescription: "Category Id can't be null!"));
        }
      } catch (error) {
        store.dispatch(ShowError(errorCode: error.hashCode, errorDescription: error.toString()));
      }
    }

    next(action);
  };
}
