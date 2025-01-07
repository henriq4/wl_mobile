import 'package:flutter/material.dart';

class TodoWidget extends StatefulWidget {
  final String title;
  final String? subtitle;
  final bool isCompleted;
  final Function onCheckChanged;
  final Function onDelete;

  const TodoWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.isCompleted,
    required this.onCheckChanged,
    required this.onDelete,
  });

  @override
  // ignore: library_private_types_in_public_api
  _TodoWidgetState createState() => _TodoWidgetState();
}

class _TodoWidgetState extends State<TodoWidget> {
  bool isExpanded = false;

  void toggleExpanded() {
    if (widget.isCompleted) return;

    setState(() {
      isExpanded = !isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: toggleExpanded,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Color(0xFFF5F7F9),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    widget.onCheckChanged();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: widget.isCompleted
                            ? Colors.grey.shade300
                            : Colors.grey.shade400,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(6),
                      color: widget.isCompleted
                          ? Colors.grey.shade300
                          : Colors.white,
                    ),
                    width: 24,
                    height: 24,
                    child: widget.isCompleted
                        ? Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 18,
                          )
                        : null,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    widget.title,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: widget.isCompleted
                          ? Colors.grey.shade500
                          : Color(0xFF3F3D56),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    widget.isCompleted ? widget.onDelete() : toggleExpanded();
                  },
                  child: widget.isCompleted
                      ? Icon(
                          Icons.delete,
                          color: Colors.red,
                        )
                      : Icon(
                          Icons.more_horiz,
                          color: Colors.grey,
                        ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            AnimatedSize(
              duration: Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              child: isExpanded
                  ? Text(
                      widget.subtitle!,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    )
                  : SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}
