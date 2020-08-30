// Packages
import 'package:redux/redux.dart';

// Redux
import 'package:flutter_redux_cascading_select/redux/order/subcategory/order_subcategory_state.dart';
import 'package:flutter_redux_cascading_select/redux/order/subcategory/order_subcategory_actions.dart';

final orderSubCategoryReducer = combineReducers<OrderSubCategoryState>([
  TypedReducer<OrderSubCategoryState, FetchingOrderSubCategories>(_fetchingSubCategories),
  TypedReducer<OrderSubCategoryState, SetOrderSubCategories>(_settingSubCategories),
  TypedReducer<OrderSubCategoryState, SetOrderSubCategory>(_settingSubCategory),
  TypedReducer<OrderSubCategoryState, ResetOrderSubCategories>(_reset),
]);

OrderSubCategoryState _fetchingSubCategories(OrderSubCategoryState state, FetchingOrderSubCategories action){
  return state.copyWith(
      isLoading: action.isLoading
  );
}

OrderSubCategoryState _settingSubCategories(OrderSubCategoryState state, SetOrderSubCategories action){
  return state.copyWith(
      subCategories: action.subCategories
  );
}

OrderSubCategoryState _settingSubCategory(OrderSubCategoryState state, SetOrderSubCategory action){
  return state.copyWith(
      subCategory: action.subCategory
  );
}

OrderSubCategoryState _reset(OrderSubCategoryState state, ResetOrderSubCategories action){
  return OrderSubCategoryState.initial();
}