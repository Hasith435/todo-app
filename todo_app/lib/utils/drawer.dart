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
import 'package:todo_app/data/database.dart';

ToDoDateBase db = ToDoDateBase();

class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  void initState() {
    // TODO: implement initState
    db.loadData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        backgroundColor: Colors.grey.shade900,
        child: ListView(
          children: [
            //put the account name and all the details here
            DrawerHeader(
              decoration: const BoxDecoration(color: Colors.black54),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Ready to be organized,",
                    style: TextStyle(color: Colors.white, fontSize: 28),
                  ),
                  Text(
                    "${db.userName}?",
                    style: const TextStyle(color: Colors.white, fontSize: 28),
                  )
                ],
              ),
            ),

            //all todos button
            Padding(
              padding:
                  const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey.shade700),
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return const HomePage();
                  }));
                },
                icon: const Icon(
                  Icons.arrow_downward_rounded,
                  color: Colors.yellow,
                ),
                label: const Text(
                  "All Tasks",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),

            //priority view button
            Padding(
              padding:
                  const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey.shade700),
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return const PriorityView();
                  }));
                },
                icon: const Icon(
                  Icons.priority_high,
                  color: Colors.red,
                ),
                label: const Text(
                  "Important tasks",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),

            //completed button
            Padding(
              padding:
                  const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey.shade700),
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return const CompletedTasks();
                  }));
                },
                icon: const Icon(
                  Icons.check,
                  color: Colors.green,
                ),
                label: const Text(
                  "Completed",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
