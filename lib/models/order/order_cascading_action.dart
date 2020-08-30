class OrderCascadingAction {
  dynamic typeOfObject;
  dynamic action;

  OrderCascadingAction(this.typeOfObject, this.action);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrderCascadingAction &&
          runtimeType == other.runtimeType &&
          typeOfObject == other.typeOfObject &&
          action == other.action;

  @override
  int get hashCode => typeOfObject.hashCode ^ action.hashCode;
}