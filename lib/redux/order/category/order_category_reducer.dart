// Packages
import 'package:redux/redux.dart';

// Redux
import 'package:flutter_redux_cascading_select/redux/order/category/order_category_state.dart';
import 'package:flutter_redux_cascading_select/redux/order/category/order_category_actions.dart';

final orderCategoryReducer = combineReducers<OrderCategoryState>([
  TypedReducer<OrderCategoryState, FetchingOrderCategories>(_fetchingCategories),
  TypedReducer<OrderCategoryState, SetOrderCategories>(_settingCategories),
  TypedReducer<OrderCategoryState, SetOrderCategory>(_settingCategory),
  TypedReducer<OrderCategoryState, ResetOrderCategories>(_reset),
]);

OrderCategoryState _fetchingCategories(OrderCategoryState state, FetchingOrderCategories action){
  return state.copyWith(
      isLoading: action.isLoading
  );
}

OrderCategoryState _settingCategories(OrderCategoryState state, SetOrderCategories action){
  return state.copyWith(
      categories: action.categories
  );
}

OrderCategoryState _settingCategory(OrderCategoryState state, SetOrderCategory action){
  return state.copyWith(
      category: action.category
  );
}

OrderCategoryState _reset(OrderCategoryState state, ResetOrderCategories action){
  return OrderCategoryState.initial();
}