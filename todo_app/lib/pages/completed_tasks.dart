import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/utils/todo_list_container.dart';
import 'package:todo_app/pages/home_page.dart';

class CompletedTasks extends StatefulWidget {
  const CompletedTasks({super.key});

  @override
  State<CompletedTasks> createState() => _CompletedTasksState();
}

class _CompletedTasksState extends State<CompletedTasks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 48, 48, 48),
      appBar: AppBar(
        title: const Text(
          "Completed tasks",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.grey[900],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 20, bottom: 10),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                "These are all your completed todos:",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: completedTodos.length,
            itemBuilder: (context, index) {
              return ToDoListCompleted(taskName: completedTodos[index][0]);
            },
          ),
        ],
      ),
    );
  }
}
