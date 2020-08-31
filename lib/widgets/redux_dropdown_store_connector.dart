// Packages
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_cascading_select/models/viewModelFromStore.dart';

// Redux
import 'package:flutter_redux_cascading_select/redux/app/app_state.dart';

// Models
import 'package:flutter_redux_cascading_select/models/cascading_interface.dart';
import 'package:flutter_redux_cascading_select/models/dropdown_item.dart';
import 'package:flutter_redux_cascading_select/models/vm.dart';

// Widget
import 'package:flutter_redux_cascading_select/widgets/redux_dropdown_stateless.dart';

class ReduxDropDownStoreConnector<T extends CascadingInterface>
    extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, List<T>>(
        distinct: false,
        converter: (store) => ViewModelFromStore.fromStore<T>(store: store, isList: true).state,
        builder: (BuildContext context, List<T> listModel) {
          print("List of " + T.toString() + " -> " + listModel.toString());
          List<DropDownItem<T>> _items = [];
          for (T element in listModel) {
            _items.add(DropDownItem<T>(element.id, element.description));
          }
          print("list of items -> " + _items.toString());
          return ReduxDropDownStateless<T>(
            dropDownItems: _items,
            preselectedItem: null,
          );
        });
  }
}
