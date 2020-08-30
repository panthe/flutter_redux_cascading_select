// Packages
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

// Redux
import 'package:flutter_redux_cascading_select/redux/app/app_state.dart';
import 'package:flutter_redux_cascading_select/redux/keys.dart';
import 'package:flutter_redux_cascading_select/redux/order/category/order_category_actions.dart';
import 'package:flutter_redux_cascading_select/redux/order/category/order_category_state.dart';
import 'package:flutter_redux_cascading_select/redux/order/product/order_product_state.dart';
import 'package:flutter_redux_cascading_select/redux/order/subcategory/order_subcategory_state.dart';

// Models
import 'package:flutter_redux_cascading_select/models/dropdown_item.dart';
import 'package:flutter_redux_cascading_select/models/order/product.dart';
import 'package:flutter_redux_cascading_select/models/order/subcategory.dart';
import 'package:flutter_redux_cascading_select/models/order/category.dart';


// Widgets
import 'package:flutter_redux_cascading_select/widgets/redux_dropdown_stateless.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var store = StoreProvider.of<AppState>(Keys.scaffoldKey.currentContext);

  @override
  void initState() {
    super.initState();
    store.dispatch(FetchOrderCategories());
  }

  @override
  Widget build(BuildContext context) {

    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            StoreConnector<AppState, OrderCategoryState>(
              distinct: true,
              converter: (store) => store.state.orderState.orderCategoryState,
              builder: (BuildContext context, OrderCategoryState orderCategoryState){
                print("Categories -> " + orderCategoryState.categories.toString());
                List<DropDownItem<Category>> _items = [];
                for (Category category in orderCategoryState.categories) {
                  _items.add(DropDownItem(category.id, category.description));
                }
                return ReduxDropDownStateless(dropDownItems: _items, preselectedItem: null, stateToObserve: store.state.orderState.orderCategoryState.category, typeOfObject: Category);
              }
            ),
            StoreConnector<AppState, OrderSubCategoryState>(
              distinct: true,
              converter: (store) => store.state.orderState.orderSubCategoryState,
              builder: (BuildContext context, OrderSubCategoryState orderSubCategoryState){
                print("SubCategories -> " + orderSubCategoryState.subCategories.toString());
                List<DropDownItem<SubCategory>> _items = [];
                for (SubCategory subCategory in orderSubCategoryState.subCategories) {
                  _items.add(DropDownItem(subCategory.id, subCategory.description));
                }
                return ReduxDropDownStateless(dropDownItems: _items, preselectedItem: null, stateToObserve: store.state.orderState.orderSubCategoryState.subCategory, typeOfObject: SubCategory);
              }
            ),
            StoreConnector<AppState, OrderProductState>(
              distinct: true,
              converter: (store) => store.state.orderState.orderProductState,
              builder: (BuildContext context, OrderProductState orderProductState){
                print("Products -> " + orderProductState.products.toString());
                List<DropDownItem<Product>> _items = [];
                for (Product product in orderProductState.products) {
                  _items.add(DropDownItem(product.id, product.description));
                }
                return ReduxDropDownStateless(dropDownItems: _items, preselectedItem: null, stateToObserve: store.state.orderState.orderProductState.product, typeOfObject: Product);
              }
            )
          ],
        ),
      )
    );
  }

}