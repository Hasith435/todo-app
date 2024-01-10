import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/data/database.dart';
import 'package:todo_app/pages/completed_tasks.dart';
import 'package:todo_app/pages/priority_view.dart';
import 'package:todo_app/utils/drawer.dart';
import 'package:todo_app/pages/home_page.dart';
import 'package:todo_app/utils/todo_list_container.dart';
import 'package:todo_app/pages/completed_tasks.dart';
import 'package:todo_app/utils/dialog_box.dart';
import 'package:todo_app/pages/login_page.dart';
import 'package:auto_size_text/auto_size_text.dart';

import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

int _selectedIndex = 0;

final screens = [
  const HomePage(),
  const PriorityView(),
  const CompletedTasks(),
];

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        animationDuration: const Duration(milliseconds: 250),
        backgroundColor: const Color.fromARGB(255, 48, 48, 48),
        color: Colors.grey.shade800,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          CurvedNavigationBarItem(
              child: Icon(
                Icons.task,
                color: Colors.yellow,
              ),
              label: "T A S K S"),
          CurvedNavigationBarItem(
              child: Icon(
                Icons.priority_high,
                color: Colors.red,
              ),
              label: "I M P O R T A N T"),
          CurvedNavigationBarItem(
              child: Icon(
                Icons.check,
                color: Colors.green,
              ),
              label: "C O M P L E T E D"),
        ],
      ),
      body: screens[_selectedIndex],
    );
  }
}
