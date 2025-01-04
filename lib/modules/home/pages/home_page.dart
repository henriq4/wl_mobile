import 'package:Taski/modules/home/view_models/item_list_view_model.dart';
import 'package:Taski/modules/home/widgets/app_bar_widget.dart';
import 'package:Taski/modules/home/widgets/todo_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final ItemListViewModel viewModel;

  const HomePage({
    super.key,
    required this.viewModel,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  @override
  void initState() {
    super.initState();
    widget.viewModel.addListener(() {
      setState(() {});
    });
  }

  get pendingItemsCount => widget.viewModel.pendingItemsCount;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome, John.',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    'Youve got $pendingItemsCount tasks to do.',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            AnimatedList(
              key: _listKey,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              initialItemCount: widget.viewModel.items.length,
              itemBuilder: (context, index, animation) {
                var item = widget.viewModel.items[index];

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
                  onDelete: () {
                    print('Deleted "${item.name}"');
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
