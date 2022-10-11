import 'package:flutter/material.dart';
import 'package:flutter_map_redux/enumeration/enumeration.dart';

@immutable
class State {
  final Iterable<String> items;
  final ItemFilter filter;

  const State({required this.items, required this.filter});

  Iterable<String> get filteredItems {
    switch (filter) {
      case ItemFilter.all:
        return items;
      case ItemFilter.longTexts:
        return items.where((element) => element.length >= 10);
      case ItemFilter.shortTexts:
        return items.where((element) => element.length <= 3);
    }
  }
}
