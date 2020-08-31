import 'package:flutter_redux_cascading_select/models/order/category.dart';
import 'package:flutter_redux_cascading_select/models/vm.dart';
import 'package:flutter_redux_cascading_select/redux/app/app_state.dart';
import 'package:redux/redux.dart';

class OrderCategoryVM extends VM<Category>{
  Category state;

  OrderCategoryVM({this.state});

  static OrderCategoryVM fromStore(Store<AppState> store) {
    return OrderCategoryVM(
      state: store.state.orderState.orderCategoryState.category
    );
  }
}