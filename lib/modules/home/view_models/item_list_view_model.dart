import 'package:Taski/modules/home/models/item_model.dart';
import 'package:flutter/material.dart';

class ItemListViewModel extends ChangeNotifier {
  final List<Item> _items = [
    Item(
      name: 'ABC sign up flow',
      description:
          'By the time a prospect arrives at your signup page, in most cases...',
      isCompleted: false,
    ),
    Item(
      name: 'Design sign up flow',
      description:
          'By the time a prospect arrives at your signup page, in most cases...',
      isCompleted: false,
    ),
    Item(
      name: 'Design sign up flow',
      description:
          'By the time a prospect arrives at your signup page, in most cases...',
      isCompleted: false,
    ),
  ];

  List<Item> _filteredItems = [];

  List<Item> get items => _items;
  List<Item> get filteredItems => _filteredItems;

  void searchTaskByName(String query) {
    if (query.isEmpty) {
      _filteredItems = [];
    } else {
      _filteredItems = _items
          .where((element) =>
              element.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }

    notifyListeners();
  }

  void toggleItemCompletion(Item item, int index) {
    item.isCompleted = !item.isCompleted;
    notifyListeners();
  }

  int get completedItemsCount =>
      _items.where((element) => element.isCompleted).length;

  int get pendingItemsCount =>
      _items.where((element) => !element.isCompleted).length;
}
