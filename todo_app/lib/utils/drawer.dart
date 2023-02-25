import 'package:flutter/material.dart';
import 'dart:ffi';

import 'package:flutter/scheduler.dart';
import 'package:todo_app/pages/completed_tasks.dart';
import 'package:todo_app/pages/priority_view.dart';
import 'package:todo_app/utils/todo_list_container.dart';
import 'package:todo_app/pages/completed_tasks.dart';
import 'package:todo_app/utils/dialog_box.dart';
import 'package:todo_app/pages/login_page.dart';
import 'package:todo_app/pages/home_page.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.grey.shade700,
      child: ListView(
        children: [
          //put the account name and all the details here
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.black54),
            child: Text(
              "drawer header",
              style: TextStyle(color: Colors.white),
            ),
          ),

          //all todos button
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return const HomePage();
                }));
              },
              icon: const Icon(Icons.tornado),
              label: const Text("All Todos"),
            ),
          ),

          //priority view button
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return const PriorityView();
                }));
              },
              icon: const Icon(Icons.priority_high),
              label: const Text("Priority View"),
            ),
          ),

          //completed button
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return const CompletedTasks();
                }));
              },
              icon: const Icon(Icons.check),
              label: const Text("Completed"),
            ),
          ),
        ],
      ),
    );
  }
}
