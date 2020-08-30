class DropDownItem<T> {
  int value;
  String name;

  DropDownItem(this.value, this.name);


  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DropDownItem &&
          runtimeType == other.runtimeType &&
          value == other.value &&
          name == other.name;

  @override
  int get hashCode => value.hashCode ^ name.hashCode;
}