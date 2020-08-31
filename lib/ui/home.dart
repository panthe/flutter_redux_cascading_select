// Packages
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_cascading_select/models/dropdown_item.dart';
import 'package:flutter_redux_cascading_select/models/order/category.dart';
import 'package:flutter_redux_cascading_select/models/order/product.dart';
import 'package:flutter_redux_cascading_select/models/order/subcategory.dart';
import 'package:flutter_redux_cascading_select/redux/app/app_state.dart';
import 'package:flutter_redux_cascading_select/redux/keys.dart';
import 'package:flutter_redux_cascading_select/redux/order/category/order_category_actions.dart';
import 'package:flutter_redux_cascading_select/redux/order/category/order_category_vm.dart';
import 'package:flutter_redux_cascading_select/redux/order/product/order_product_vm.dart';
import 'package:flutter_redux_cascading_select/redux/order/subcategory/order_subcategory_vm.dart';
import 'package:flutter_redux_cascading_select/widgets/redux_dropdown_stateless.dart';
import 'package:flutter_redux_cascading_select/widgets/redux_dropdown_store_connector.dart';

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
            /*
              ******  BUG NOTE  *****
              Working on this component but in this moment it doesn't works
              If you decommented these lines (and commented the others lines below)
              you can test it.
              For now I don't understand the difference between these two solutions
              the second one works fine.
              The first one fullfill the dropdowns correctly but if you select
              an element in the dropdown and you follow the flow of data you can
              view that the stateToObserveForElement in the widget
              reduxDropDownStateless appears correctly instanciated
              before the selection and change to null after the dispatch of the
              action SetOrderCascadingId
            */
///*
            ReduxDropDownStoreConnector<Category>(),
            ReduxDropDownStoreConnector<SubCategory>(),
            ReduxDropDownStoreConnector<Product>(),
//*/
/*
          StoreConnector<AppState, List<Category>>(
              distinct: false,
              converter: (store) =>
                  store.state.orderState.orderCategoryState.categories,
              builder: (BuildContext context, List<Category> categories) {
                print("Categories -> " + categories.toString());
                List<DropDownItem<Category>> _items = [];
                for (Category category in categories) {
                  _items.add(DropDownItem(category.id, category.description));
                }
                print("list of items -> " + _items.toString());
                return ReduxDropDownStateless<Category>(
                    dropDownItems: _items,
                    preselectedItem: null,
                    stateToObserve:
                        store.state.orderState.orderCategoryState.category);
              }),
          StoreConnector<AppState, List<SubCategory>>(
            distinct: false,
            converter: (store) => store.state.orderState.orderSubCategoryState.subCategories,
            builder: (BuildContext context, List<SubCategory> subCategories){
              print("SubCategories -> " + subCategories.toString());
              List<DropDownItem<SubCategory>> _items = [];
              for (SubCategory subCategory in subCategories) {
                _items.add(DropDownItem(subCategory.id, subCategory.description));
              }
              return ReduxDropDownStateless<SubCategory>(dropDownItems: _items, preselectedItem: null, stateToObserve: store.state.orderState.orderSubCategoryState.subCategory);
            }
          ),
          StoreConnector<AppState, List<Product>>(
            distinct: false,
            converter: (store) => store.state.orderState.orderProductState.products,
            builder: (BuildContext context, List<Product> products){
              print("Products -> " + products.toString());
              List<DropDownItem<Product>> _items = [];
              for (Product product in products) {
                _items.add(DropDownItem(product.id, product.description));
              }
              return ReduxDropDownStateless<Product>(dropDownItems: _items, preselectedItem: null, stateToObserve: store.state.orderState.orderProductState.product);
            }
          )
*/
          ],
        ),
      ),
    );
  }
}
