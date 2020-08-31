// Packages
import 'package:flutter/material.dart';

// Redux
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_cascading_select/redux/app/app_state.dart';
import 'package:flutter_redux_cascading_select/redux/keys.dart';
import 'package:flutter_redux_cascading_select/redux/order/category/order_category_actions.dart';

// Models
import 'package:flutter_redux_cascading_select/models/order/category.dart';
import 'package:flutter_redux_cascading_select/models/order/product.dart';
import 'package:flutter_redux_cascading_select/models/order/subcategory.dart';

// Widgets
import 'package:flutter_redux_cascading_select/widgets/redux_cascading_select.dart';

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
            ReduxCascadingSelect<Category>(),
            ReduxCascadingSelect<SubCategory>(),
            ReduxCascadingSelect<Product>(),
          ],
        ),
      ),
    );
  }
}
