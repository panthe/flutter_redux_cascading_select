import 'package:flutter_redux_cascading_select/redux/app/app_state.dart';
import 'package:redux/redux.dart';

import 'order/category.dart';
import 'order/product.dart';
import 'order/subcategory.dart';

class ViewModelFromStore<T> {
  T state;

  ViewModelFromStore(this.state);

  static ViewModelFromStore fromStore<T>({Store<AppState> store, bool isList}) {
    switch (T) {
      case Category: {
        return ViewModelFromStore(isList ? store.state.orderState.orderCategoryState.categories : store.state.orderState.orderCategoryState.category);
        break;
      }

      case SubCategory: {
        return ViewModelFromStore(isList ? store.state.orderState.orderSubCategoryState.subCategories :store.state.orderState.orderSubCategoryState.subCategory);
        break;
      }

      case Product: {
        return ViewModelFromStore(isList ? store.state.orderState.orderProductState.products :store.state.orderState.orderProductState.product);
        break;
      }
    }
  }
}