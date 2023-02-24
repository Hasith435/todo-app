import 'dart:ffi';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/pages/completed_tasks.dart';
import 'package:todo_app/pages/priority_view.dart';
import 'package:todo_app/utils/todo_list_container.dart';
import 'package:todo_app/pages/completed_tasks.dart';
import 'package:todo_app/utils/dialog_box.dart';
import 'package:todo_app/pages/login_page.dart';
import 'package:todo_app/pages/home_page.dart';

List dateSortVariables = ["Any", "Today", "Tommorow", "Specific date"];

List priorities = ["Any", "High", "Medium", "Low"];

String? dateVal;
String? priorityVal;

bool showEveryTask = false;

class TaskSort extends StatefulWidget {
  const TaskSort({super.key});

  @override
  State<TaskSort> createState() => _TaskSortState();
}

class _TaskSortState extends State<TaskSort> {
  @override
  Widget build(BuildContext context) {
    final _titleSortController = TextEditingController();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Container(
        padding: const EdgeInsets.only(top: 15, left: 15),
        height: 300,
        width: 400,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey.shade600),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            //drop down for date
            Padding(
              padding: const EdgeInsets.only(top: 8, right: 25),
              child: DropdownButtonFormField2(
                icon: const Icon(Icons.arrow_drop_down),
                iconSize: 25,
                iconEnabledColor: Colors.white,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey.shade700,
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade600))),
                dropdownDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey.shade700),
                value: dateVal,
                onChanged: (value) {
                  setState(() {
                    dateVal = value as String;
                  });
                },
                isExpanded: false,
                items: dateSortVariables
                    .map((item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: const TextStyle(
                                fontSize: 14, color: Colors.white),
                          ),
                        ))
                    .toList(),
                hint: const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Date:",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),

            //Priority
            Padding(
              padding: const EdgeInsets.only(top: 8, right: 25),
              child: DropdownButtonFormField2(
                icon: const Icon(Icons.arrow_drop_down),
                iconSize: 25,
                iconEnabledColor: Colors.white,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey.shade700,
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade600))),
                dropdownDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey.shade700),
                value: priorityVal,
                onChanged: (value) {
                  setState(() {
                    priorityVal = value as String;
                  });
                },
                isExpanded: false,
                items: priorities
                    .map((item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: const TextStyle(
                                fontSize: 14, color: Colors.white),
                          ),
                        ))
                    .toList(),
                hint: const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Priority:",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 8, right: 25),
              child: TextField(
                style: const TextStyle(color: Colors.white),
                controller: _titleSortController,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[700],
                    hintText: "   Task title",
                    hintStyle: const TextStyle(color: Colors.white),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey.shade900))),
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(0, 14, 25, 0),
              child: SizedBox(
                width: 150,
                height: 40,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (dateVal == "Any" && priorityVal == "Any") {
                        showEveryTask = true;
                        debugPrint('if');
                      } else {
                        showEveryTask = false;
                        debugPrint('else');
                      }
                    });

                    debugPrint('date val $dateVal');
                    debugPrint('priority val $priorityVal');
                    debugPrint('show every task $showEveryTask');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 151, 247, 154),
                  ),
                  child: const Text(
                    "sort",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
