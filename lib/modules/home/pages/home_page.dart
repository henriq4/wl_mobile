import 'package:Taski/modules/home/models/item_model.dart';
import 'package:Taski/modules/home/view_models/item_list_view_model.dart';
import 'package:Taski/modules/home/widgets/app_bar_widget.dart';
import 'package:Taski/modules/home/widgets/todo_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ItemListViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = ItemListViewModel(ItemList());
  }

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
                    'You’ve got 7 tasks to do.',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: _viewModel.items.length,
              itemBuilder: (context, index) {
                var item = _viewModel.items[index];

                return TodoWidget(
                  title: item.name,
                  subtitle: item.description,
                  isCompleted: item.isCompleted,
                  onCheckChanged: () {
                    setState(() {
                      item.isCompleted = !item.isCompleted;
                    });
                  },
                  onDelete: () {
                    print('Deleted "Design sign up flow"');
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
