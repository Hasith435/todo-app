import 'package:flutter/material.dart';

class CompletedTasks extends StatefulWidget {
  const CompletedTasks({super.key});

  @override
  State<CompletedTasks> createState() => _CompletedTasksState();
}

class _CompletedTasksState extends State<CompletedTasks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 88, 88, 88),
      appBar: AppBar(
        title: const Text(
          "Completed tasks",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.grey[800],
      ),
    );
  }
}
