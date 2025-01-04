import 'package:Taski/modules/home/pages/done_page.dart';
import 'package:Taski/modules/home/pages/home_page.dart';
import 'package:Taski/modules/home/view_models/item_list_view_model.dart';
import 'package:flutter/material.dart';
import 'package:lazy_load_indexed_stack/lazy_load_indexed_stack.dart';

class LayoutWidget extends StatefulWidget {
  final int? initalIndex;

  const LayoutWidget({super.key, this.initalIndex});

  @override
  State<LayoutWidget> createState() => _LayoutWidgetState();
}

class _LayoutWidgetState extends State<LayoutWidget> {
  final ItemListViewModel _viewModel = ItemListViewModel();

  var _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initalIndex ?? 0;
  }

  _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LazyLoadIndexedStack(
        index: _selectedIndex,
        children: [
          HomePage(viewModel: _viewModel),
          Placeholder(),
          Placeholder(),
          DonePage(viewModel: _viewModel),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.transparent,
        selectedIndex: _selectedIndex,
        onDestinationSelected: _onTap,
        destinations: [
          NavigationDestination(
            icon: const Icon(Icons.format_list_bulleted),
            selectedIcon: const Icon(Icons.format_list_bulleted),
            label: "Todo",
          ),
          NavigationDestination(
            icon: const Icon(Icons.add_box_outlined),
            selectedIcon: const Icon(Icons.add_box_outlined),
            label: "Create",
          ),
          NavigationDestination(
            icon: const Icon(Icons.search_outlined),
            selectedIcon: const Icon(Icons.search_outlined),
            label: "Search",
          ),
          NavigationDestination(
            icon: const Icon(Icons.done),
            selectedIcon: const Icon(Icons.done),
            label: "Done",
          ),
        ],
      ),
    );
  }
}
