import 'package:Taski/modules/home/view_models/item_list_view_model.dart';
import 'package:Taski/modules/home/widgets/app_bar_widget.dart';
import 'package:Taski/modules/home/widgets/create_task_button_widget.dart';
import 'package:Taski/modules/home/widgets/form_modal_widget.dart';
import 'package:flutter/material.dart';

class CreatePage extends StatefulWidget {
  final ItemListViewModel viewModel;

  const CreatePage({
    super.key,
    required this.viewModel,
  });

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
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
                  'Create tasks to achieve more.',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF8D9CB8),
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                spacing: 8,
                children: [
                  Image.asset('assets/images/board.png'),
                  Text(
                    'Create task',
                    style: TextStyle(
                      color: Colors.grey.shade700,
                    ),
                  ),
                  SizedBox(height: 12),
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
              )
            ],
          ),
          Spacer(),
        ],
      ),
    );
  }
}
