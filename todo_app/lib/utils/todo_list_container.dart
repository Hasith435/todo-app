import 'package:flutter/material.dart';

class ToDoList extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;

  ToDoList(
      {super.key,
      required this.taskName,
      required this.taskCompleted,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16), color: Colors.grey[600]),
          child: Row(
            children: [
              Checkbox(value: taskCompleted, onChanged: onChanged),
              const Text(
                'Code app',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ],
          ),
        ));
  }
}
