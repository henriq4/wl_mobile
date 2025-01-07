import 'package:Taski/modules/home/view_models/item_list_view_model.dart';
import 'package:Taski/modules/home/widgets/app_bar_widget.dart';
import 'package:Taski/modules/home/widgets/create_task_button_widget.dart';
import 'package:Taski/modules/home/widgets/form_modal_widget.dart';
import 'package:Taski/modules/home/widgets/todo_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final ItemListViewModel viewModel;
  final VoidCallback onNavigateToCreate;

  const HomePage({
    super.key,
    required this.viewModel,
    required this.onNavigateToCreate,
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
      setState(() {
        _insertItem();
      });
    });
  }

  void _insertItem() {
    _listKey.currentState?.insertItem(widget.viewModel.items.length - 1);
  }

  get pendingItemsCount => widget.viewModel.pendingItemsCount;
  get items => widget.viewModel.items;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    text: 'Welcome, ',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF3F3D56),
                    ),
                    children: [
                      TextSpan(
                        text: 'John.',
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  pendingItemsCount == 0
                      ? 'Create tasks to achieve more.'
                      : 'You\'ve got $pendingItemsCount tasks to do.',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF8D9CB8),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: pendingItemsCount == 0
                ? Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset('assets/images/board.png'),
                        const SizedBox(height: 8),
                        Text(
                          'Create some task',
                          style: TextStyle(
                            color: Colors.grey.shade700,
                          ),
                        ),
                        const SizedBox(height: 12),
                        CreateTaskButton(
                          onPressed: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (context) =>
                                  FormModal(viewModel: widget.viewModel),
                            );
                          },
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      var item = items[index];

                      if (item.isCompleted) {
                        return const SizedBox();
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
                  ),
          ),
        ],
      ),
    );
  }
}
