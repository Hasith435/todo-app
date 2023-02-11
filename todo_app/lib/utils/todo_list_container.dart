import 'package:flutter/material.dart';

class ToDoList extends StatelessWidget {
  const ToDoList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16), color: Colors.grey[600]),
          child: const Text(
            'Code app',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ));
  }
}
