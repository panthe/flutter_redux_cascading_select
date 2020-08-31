// Models
import 'package:flutter_redux_cascading_select/models/cascading_interface.dart';

class SubCategory extends CascadingInterface {
  int id;
  int idCategory;
  String description;

  SubCategory({
    this.id,
    this.idCategory,
    this.description
  }): super(id,description);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SubCategory &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          idCategory == other.idCategory &&
          description == other.description;

  @override
  int get hashCode => id.hashCode ^ idCategory.hashCode ^ description.hashCode;
}