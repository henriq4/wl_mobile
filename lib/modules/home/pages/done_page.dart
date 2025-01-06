import 'package:Taski/modules/home/view_models/item_list_view_model.dart';
import 'package:Taski/modules/home/widgets/app_bar_widget.dart';
import 'package:Taski/modules/home/widgets/todo_widget.dart';
import 'package:flutter/material.dart';

class DonePage extends StatefulWidget {
  final ItemListViewModel viewModel;

  const DonePage({
    super.key,
    required this.viewModel,
  });

  @override
  State<DonePage> createState() => _DonePageState();
}

class _DonePageState extends State<DonePage> {
  @override
  void initState() {
    super.initState();
    widget.viewModel.addListener(() {
      setState(() {});
    });
  }

  get completedItemsCount => widget.viewModel.completedItemsCount;

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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Completed Tasks',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF3F3D56),
                    ),
                  ),
                  TextButton(
                    style: ButtonStyle(
                      overlayColor:
                          WidgetStateProperty.all(Colors.red.shade100),
                    ),
                    onPressed: () {
                      widget.viewModel.deleteAllDone();
                    },
                    child: Text(
                      'Delete all',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.red,
                      ),
                    ),
                  )
                ],
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: widget.viewModel.items.length,
              itemBuilder: (context, index) {
                var item = widget.viewModel.items[index];

                if (!item.isCompleted) {
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
                    widget.viewModel.deleteItem(item);
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
