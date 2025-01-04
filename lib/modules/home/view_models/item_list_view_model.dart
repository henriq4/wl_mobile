import 'package:Taski/modules/home/models/item_model.dart';

class ItemListViewModel {
  ItemList _itemList;

  ItemListViewModel(this._itemList);

  List<Item> get items => _itemList.items;
}
