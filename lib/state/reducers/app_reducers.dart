import 'package:flutter_map_redux/enumeration/enumeration.dart';
import 'package:flutter_map_redux/state/actions/main_action.dart';
import 'package:flutter_map_redux/state/models/app_state.dart';
import 'package:redux/redux.dart';

extension AddRemoveItem<T> on Iterable<T> {
  Iterable<T> operator +(T other) => followedBy([other]);
  Iterable<T> operator -(T other) => where((element) => element != other);
}

Iterable<String> addItemReducer(
        Iterable<String> previusItems, AddItemAction action) =>
    previusItems + action.item;

Iterable<String> removeItemReducer(
        Iterable<String> previusItems, RemoveItemAction action) =>
    previusItems - action.item;

Reducer<Iterable<String>> itemReducer = combineReducers<Iterable<String>>([
  TypedReducer<Iterable<String>, AddItemAction>(addItemReducer),
  TypedReducer<Iterable<String>, RemoveItemAction>(removeItemReducer)
]);

ItemFilter itemFilterReducer(State oldState, MainActions action) {
  if (action is ChangeFilterTypeAction) {
    return action.filter;
  } else {
    return oldState.filter;
  }
}

State appStateReducer(State oldState, action) => State(
    items: itemReducer(oldState.items, action),
    filter: itemFilterReducer(oldState, action));
