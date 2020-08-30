// Packages
import 'package:flutter/material.dart';

// Redux
import 'package:flutter_redux_cascading_select/models/order/product.dart';

@immutable
class OrderProductState {
  final bool isLoading;
  final List<Product> products;
  final Product product;

  OrderProductState({
    this.isLoading,
    this.products,
    this.product
  });

  OrderProductState copyWith({
    bool isLoading,
    List<Product> products,
    Product product
  }){
    return new OrderProductState(
      isLoading: isLoading ?? this.isLoading,
      products: products ?? this.products,
      product: product ?? this.product,
    );
  }

  factory OrderProductState.initial(){
    return new OrderProductState(
        isLoading: false,
        products: [],
        product: null
    );
  }
}