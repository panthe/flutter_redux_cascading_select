// Packages
import 'package:flutter/material.dart';

// Redux
import 'package:flutter_redux_cascading_select/models/order/product.dart';

class FetchingOrderProducts {
  bool isLoading;

  FetchingOrderProducts({
    @required this.isLoading,
  });
}

class FetchOrderProducts {
  final int idSubCategory;

  FetchOrderProducts({
    @required this.idSubCategory,
  });
}

class SetOrderProducts {
  final List<Product> products;

  SetOrderProducts({
    @required this.products,
  });
}

class SetOrderProductId {
  final int id;

  SetOrderProductId({
    @required this.id,
  });
}

class SetOrderProduct {
  final Product product;

  SetOrderProduct({
    @required this.product,
  });
}

class ResetOrderProducts {}