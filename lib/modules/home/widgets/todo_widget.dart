import 'package:flutter/material.dart';

class TodoWidget extends StatefulWidget {
  final String title;
  final String? subtitle;
  final bool isCompleted;
  final Function onCheckChanged;
  final Function onDelete;

  TodoWidget({
    required this.title,
    required this.subtitle,
    required this.isCompleted,
    required this.onCheckChanged,
    required this.onDelete,
  });

  @override
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
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
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
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: widget.isCompleted ? Colors.blue : Colors.grey,
                        width: 2,
                      ),
                      color: widget.isCompleted ? Colors.blue : Colors.white,
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
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: widget.isCompleted ? Colors.grey : Colors.black,
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
