// Models
import 'package:flutter_redux_cascading_select/models/cascading_interface.dart';

class Category extends CascadingInterface {
  int id;
  String description;

  Category({
    this.id,
    this.description
  }) : super(id,description);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Category &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          description == other.description;

  @override
  int get hashCode => id.hashCode ^ description.hashCode;
}