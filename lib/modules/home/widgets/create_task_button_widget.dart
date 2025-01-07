import 'package:flutter/material.dart';

class CreateTaskButton extends StatelessWidget {
  final void Function()? onPressed;

  const CreateTaskButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ButtonStyle(
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        elevation: WidgetStateProperty.all(0),
        backgroundColor: WidgetStateProperty.all(
          Colors.blue.shade50,
        ),
      ),
      onPressed: onPressed,
      icon: Icon(
        Icons.add,
        color: Colors.blue.shade800,
        size: 20,
      ),
      label: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          'Create task',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.blue.shade800,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
