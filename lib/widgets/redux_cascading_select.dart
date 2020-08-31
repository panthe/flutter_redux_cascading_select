// Packages
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_cascading_select/models/viewModelFromStore.dart';

// Redux
import 'package:flutter_redux_cascading_select/redux/app/app_state.dart';
import 'package:flutter_redux_cascading_select/redux/keys.dart';
import 'package:flutter_redux_cascading_select/redux/order/order_actions.dart';

// Models
import 'package:flutter_redux_cascading_select/models/cascading_interface.dart';
import 'package:flutter_redux_cascading_select/models/dropdown_item.dart';

class ReduxCascadingSelect<T extends CascadingInterface>
    extends StatelessWidget {
  final store = StoreProvider.of<AppState>(Keys.scaffoldKey.currentContext);
  DropDownItem preselectedItem;

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
          return StoreConnector<AppState, T >(
            distinct: true,
            converter: (store) => ViewModelFromStore.fromStore<T>(store: store, isList: false).state,
            builder: (BuildContext context, T element) {

              print(T.toString() + " id " + element?.id.toString() + " description " + element?.description.toString());
              return LayoutBuilder(builder: (context, constraints) {
                return Container(
                    height: 40.0,
                    width: constraints.maxWidth,
                    decoration: BoxDecoration(
                      border: Border.all(
                          width: 1.0
                      ),
                      borderRadius: BorderRadius.all(
                          Radius.circular(5.0)
                      ),
                    ),
                    padding: EdgeInsets.symmetric(
                        vertical: 5.0,
                        horizontal: 20.0
                    ),
                    margin: EdgeInsets.symmetric(
                        vertical: 5.0,
                        horizontal: 20.0
                    ),
                    child: DropdownButton<DropDownItem>(
                        isExpanded: true,
                        hint: Text("Select " + T.toString()),
                        underline: SizedBox.shrink(),
                        value: (element == null)
                            ? preselectedItem
                            : _items
                            .firstWhere((el) => el.value == element.id),
                        items: _createDropDownItems(_items),
                        onChanged: (el) {
                          store.dispatch(SetResetCascadingOrderFrom(obj: T)); //TODO Abstraction on the Reset function
                          store.dispatch(SetOrderCascadingId(obj: T, id: el.value)); //TODO Abstraction on the SetCascadingId function
                        }));
              });
            },
          );;
        });
  }

  List<DropdownMenuItem<DropDownItem>> _createDropDownItems(
      List<DropDownItem> listItems) {
    List<DropdownMenuItem<DropDownItem>> items = List();
    for (DropDownItem listItem in listItems) {
      items.add(
        DropdownMenuItem(
          child: Text(listItem.name),
          value: listItem,
        ),
      );
    }
    return items;
  }
}
