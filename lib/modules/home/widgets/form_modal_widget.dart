import 'package:Taski/modules/home/view_models/item_list_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class FormModal extends StatelessWidget {
  final ItemListViewModel viewModel;
  final _formKey = GlobalKey<FormBuilderState>();

  FormModal({
    super.key,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: FormBuilder(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              _TaskFormField(
                name: 'name',
                labelText: "What's in your mind?",
                icon: Icons.inbox_rounded,
              ),
              const SizedBox(height: 16),
              _TaskFormField(
                name: 'description',
                labelText: 'Add a note',
                icon: Icons.edit,
              ),
              const SizedBox(height: 24),
              TextButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(
                    Colors.blue.shade50,
                  ),
                ),
                onPressed: () {
                  final name =
                      _formKey.currentState?.fields['name']?.value ?? '';
                  final description =
                      _formKey.currentState?.fields['description']?.value ?? '';
                  viewModel.addItem(name, description);
                  Navigator.pop(context);
                },
                child: const Text(
                  'Create',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}

class _TaskFormField extends StatelessWidget {
  final String name;
  final String labelText;
  final IconData icon;

  const _TaskFormField({
    required this.name,
    required this.labelText,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: name,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.bold,
        ),
        prefixIcon: Icon(icon),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.transparent,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blue.shade400,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
