// Packages
import 'package:flutter/material.dart';
import 'package:flutter_redux_cascading_select/models/order/subcategory.dart';

class FetchingOrderSubCategories {
  bool isLoading;

  FetchingOrderSubCategories({
    @required this.isLoading,
  });
}

class FetchOrderSubCategories {
  final int idCategory;

  FetchOrderSubCategories({
    @required this.idCategory,
  });
}

class SetOrderSubCategories {
  final List<SubCategory> subCategories;

  SetOrderSubCategories({
    @required this.subCategories,
  });
}

class SetOrderSubCategoryId {
  final int id;

  SetOrderSubCategoryId({
    @required this.id,
  });
}

class SetOrderSubCategory {
  final SubCategory subCategory;

  SetOrderSubCategory({
    @required this.subCategory,
  });
}

class ResetOrderSubCategories {}
