// Packages
import 'package:flutter/material.dart';

// Redux
import 'package:flutter_redux_cascading_select/models/order/category.dart';

@immutable
class OrderCategoryState {
  final bool isLoading;
  final List<Category> categories;
  final Category category;

  OrderCategoryState({
    this.isLoading,
    this.categories,
    this.category
  });

  OrderCategoryState copyWith({
    bool isLoading,
    List<Category> categories,
    Category category
  }){
    return new OrderCategoryState(
      isLoading: isLoading ?? this.isLoading,
      categories: categories ?? this.categories,
      category: category ?? this.category,
    );
  }

  factory OrderCategoryState.initial(){
    return new OrderCategoryState(
        isLoading: false,
        categories: [],
        category: null
    );
  }
}