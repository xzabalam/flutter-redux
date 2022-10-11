import 'package:flutter/material.dart';

import '../../enumeration/enumeration.dart';

@immutable
abstract class MainActions {
  const MainActions();
}

@immutable
class ChangeFilterTypeAction extends MainActions {
  final ItemFilter filter;
  const ChangeFilterTypeAction(this.filter);
}

@immutable
abstract class ItemAction extends MainActions {
  final String item;
  const ItemAction(this.item);
}

@immutable
class AddItemAction extends ItemAction {
  const AddItemAction(String item) : super(item);
}

@immutable
class RemoveItemAction extends ItemAction {
  const RemoveItemAction(String item) : super(item);
}
