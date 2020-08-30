//Redux
import 'package:flutter_redux_cascading_select/redux/order/category/order_category_actions.dart';
import 'package:flutter_redux_cascading_select/redux/order/subcategory/order_subcategory_actions.dart';
import 'package:flutter_redux_cascading_select/redux/order/product/order_product_actions.dart';

// Models
import 'package:flutter_redux_cascading_select/models/order/order_cascading_action.dart';
import 'package:flutter_redux_cascading_select/models/order/category.dart';
import 'package:flutter_redux_cascading_select/models/order/subcategory.dart';
import 'package:flutter_redux_cascading_select/models/order/product.dart';

final List<OrderCascadingAction> orderCascadingActionList = [
  OrderCascadingAction(Category, ResetOrderCategories()),
  OrderCascadingAction(SubCategory, ResetOrderSubCategories()),
  OrderCascadingAction(Product, ResetOrderProducts()),
];