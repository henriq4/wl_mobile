import 'package:Taski/modules/home/view_models/item_list_view_model.dart';
import 'package:Taski/modules/home/widgets/app_bar_widget.dart';
import 'package:Taski/modules/home/widgets/todo_widget.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  final ItemListViewModel viewModel;

  const SearchPage({
    super.key,
    required this.viewModel,
  });

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    widget.viewModel.addListener(_updateSearchResults);
  }

  @override
  void dispose() {
    widget.viewModel.removeListener(_updateSearchResults);
    super.dispose();
  }

  void _updateSearchResults() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final filteredItems = widget.viewModel.filteredItems;

    return Scaffold(
      appBar: AppBarWidget(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Search',
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.blue,
                  ),
                  fillColor: Color(0xFFF5F7F9),
                  //verify if is focus to filled
                  filled: true,
                  focusColor: Color(0xFFF5F7F9),
                  suffixIcon: _searchController.text.isEmpty
                      ? null
                      : IconButton(
                          icon: Icon(
                            Icons.close,
                            color: Colors.grey,
                            size: 15,
                          ),
                          onPressed: () {
                            _searchController.clear();
                            widget.viewModel.searchTaskByName('');
                          },
                        ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
                onChanged: widget.viewModel.searchTaskByName,
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: filteredItems.isEmpty ? 1 : filteredItems.length,
              itemBuilder: (context, index) {
                if (_searchController.text.isEmpty) {
                  return SizedBox.shrink();
                }

                if (filteredItems.isEmpty) {
                  return Padding(
                    padding: EdgeInsets.only(top: 128),
                    child: Center(
                      child: Column(
                        spacing: 12,
                        children: [
                          Image.asset('assets/images/board.png'),
                          Text(
                            'No results found',
                            style: TextStyle(
                              color: Colors.grey.shade700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }

                var item = filteredItems[index];

                if (item.isCompleted) {
                  return SizedBox();
                }

                return TodoWidget(
                  title: item.name,
                  subtitle: item.description,
                  isCompleted: item.isCompleted,
                  onCheckChanged: () {
                    widget.viewModel.toggleItemCompletion(item, index);
                  },
                  onDelete: () {},
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
