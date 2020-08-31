import 'package:flutter_redux_cascading_select/models/order/subcategory.dart';
import 'package:flutter_redux_cascading_select/models/vm.dart';
import 'package:flutter_redux_cascading_select/redux/app/app_state.dart';
import 'package:redux/redux.dart';

class OrderSubCategoryVM extends VM<SubCategory>{
  SubCategory state;

  OrderSubCategoryVM({this.state});

  static OrderSubCategoryVM fromStore(Store<AppState> store) {
    return OrderSubCategoryVM(
        state: store.state.orderState.orderSubCategoryState.subCategory
    );
  }
}