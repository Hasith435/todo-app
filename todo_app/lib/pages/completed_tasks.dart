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
  void initState() {
    // TODO: implement initState
    db.loadData();
  }

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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 20, bottom: 10),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  "These are all your completed Tasks:",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: db.completedTodos.length,
              itemBuilder: (context, index) {
                return ToDoListCompleted(taskName: db.completedTodos[index][0]);
              },
            ),
          ],
        ),
      ),
    );
  }
}
