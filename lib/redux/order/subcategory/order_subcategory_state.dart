// Packages
import 'package:flutter/material.dart';

// Redux
import 'package:flutter_redux_cascading_select/models/order/subcategory.dart';

@immutable
class OrderSubCategoryState {
  final bool isLoading;
  final List<SubCategory> subCategories;
  final SubCategory subCategory;

  OrderSubCategoryState({
    this.isLoading,
    this.subCategories,
    this.subCategory
  });

  OrderSubCategoryState copyWith({
    bool isLoading,
    List<SubCategory> subCategories,
    SubCategory subCategory
  }){
    return new OrderSubCategoryState(
      isLoading: isLoading ?? this.isLoading,
      subCategories: subCategories ?? this.subCategories,
      subCategory: subCategory ?? this.subCategory,
    );
  }

  factory OrderSubCategoryState.initial(){
    return new OrderSubCategoryState(
        isLoading: false,
        subCategories: [],
        subCategory: null
    );
  }
}