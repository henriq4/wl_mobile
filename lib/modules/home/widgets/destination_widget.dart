import 'package:flutter/material.dart';

class DestinationWidget extends StatelessWidget {
  final IconData icon;
  final String label;

  const DestinationWidget({
    super.key,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return NavigationDestination(
      icon: Icon(
        icon,
        color: Colors.grey,
      ),
      selectedIcon: Icon(
        icon,
        color: Colors.blue,
      ),
      label: label,
    );
  }
}
