// Models
import 'package:flutter_redux_cascading_select/models/cascading_interface.dart';

class Product extends CascadingInterface {
  int id;
  int idSubCategory;
  String description;
  double price;

  Product({
    this.id,
    this.idSubCategory,
    this.description,
    this.price
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Product &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          idSubCategory == other.idSubCategory &&
          description == other.description &&
          price == other.price;

  @override
  int get hashCode =>
      id.hashCode ^
      idSubCategory.hashCode ^
      description.hashCode ^
      price.hashCode;
}