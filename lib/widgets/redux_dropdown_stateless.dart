// Packages
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

// Redux

import 'package:flutter_redux_cascading_select/redux/app/app_state.dart';
import 'package:flutter_redux_cascading_select/redux/keys.dart';
import 'package:flutter_redux_cascading_select/redux/order/order_actions.dart';

// Models
import 'package:flutter_redux_cascading_select/models/dropdown_item.dart';
import 'package:flutter_redux_cascading_select/models/cascading_interface.dart';

class ReduxDropDownStateless<T extends CascadingInterface> extends StatelessWidget {
  final store = StoreProvider.of<AppState>(Keys.scaffoldKey.currentContext);
  final List<DropDownItem> dropDownItems;
  final DropDownItem preselectedItem;
  final dynamic stateToObserve;
  final Type typeOfObject;

  ReduxDropDownStateless({Key key, this.dropDownItems, this.preselectedItem, this.stateToObserve, this.typeOfObject}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("build DropDown");
    return StoreConnector<AppState, T>(
      distinct: true,
      converter: (store) => cast<T>(stateToObserve),
      builder: (BuildContext context, T elementModel){
        print(typeOfObject.toString() + " id " + elementModel?.id.toString());
        return LayoutBuilder(
          builder: (context, constraints) {
            return Container(
              height: 40.0,
              width: constraints.maxWidth,
              padding: EdgeInsets.symmetric(
                vertical: 5.0,
                horizontal: 20.0
              ),
              child: DropdownButton<DropDownItem>(
                  isExpanded: true,
                  hint: Text("Select " + typeOfObject.toString()),
                  value: (elementModel == null) ? preselectedItem : dropDownItems.firstWhere((el) => el.value == elementModel.id) ,
                  items: _createDropDownItems(dropDownItems),
                  onChanged: (el) {
                    store.dispatch(SetResetCascadingOrderFrom(obj: typeOfObject));
                    store.dispatch(SetOrderCascadingId(obj: typeOfObject, id: el.value));
                  }
              )
            );
          }
        );
      },
    );
  }

  List<DropdownMenuItem<DropDownItem>> _createDropDownItems(List<DropDownItem> listItems) {
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

T cast<T>(x) => x is T ? x : null;