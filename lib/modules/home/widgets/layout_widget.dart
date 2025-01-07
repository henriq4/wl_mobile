import 'package:Taski/modules/home/pages/create_page.dart';
import 'package:Taski/modules/home/pages/done_page.dart';
import 'package:Taski/modules/home/pages/home_page.dart';
import 'package:Taski/modules/home/pages/search_page.dart';
import 'package:Taski/modules/home/view_models/item_list_view_model.dart';
import 'package:Taski/modules/home/widgets/destination_widget.dart';
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
          HomePage(
            viewModel: _viewModel,
            onNavigateToCreate: () => _onTap(1),
          ),
          CreatePage(viewModel: _viewModel),
          SearchPage(viewModel: _viewModel),
          DonePage(viewModel: _viewModel),
        ],
      ),
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>(
            (states) {
              if (states.contains(WidgetState.selected)) {
                return TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                );
              }
              return TextStyle(
                color: Colors.grey,
              );
            },
          ),
        ),
        child: NavigationBar(
          backgroundColor: Colors.transparent,
          selectedIndex: _selectedIndex,
          onDestinationSelected: _onTap,
          destinations: [
            DestinationWidget(icon: Icons.format_list_bulleted, label: "Todo"),
            DestinationWidget(icon: Icons.add_box_outlined, label: "Create"),
            DestinationWidget(icon: Icons.search_outlined, label: "Search"),
            DestinationWidget(icon: Icons.done, label: "Done"),
          ],
        ),
      ),
    );
  }
}
