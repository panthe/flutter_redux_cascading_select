// Packages
import 'package:flutter/material.dart';

// Redux
import 'package:flutter_redux_cascading_select/models/order/category.dart';

class FetchingOrderCategories {
  bool isLoading;

  FetchingOrderCategories({
    @required this.isLoading,
  });
}

class FetchOrderCategories {}

class SetOrderCategories {
  final List<Category> categories;

  SetOrderCategories({
    @required this.categories,
  });
}

class SetOrderCategoryId {
  final int id;

  SetOrderCategoryId({
    @required this.id,
  });
}

class SetOrderCategory {
  final Category category;

  SetOrderCategory({
    @required this.category,
  });
}

class ResetOrderCategories {}