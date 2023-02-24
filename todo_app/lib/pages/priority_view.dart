import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:todo_app/pages/home_page.dart';
import 'package:todo_app/utils/todo_list_container.dart';

String? selectedValuePView;

List sortingListItems = ["All", "High", "Medium", "Low"];

class PriorityView extends StatefulWidget {
  const PriorityView({super.key});

  @override
  State<PriorityView> createState() => _PriorityViewState();
}

class _PriorityViewState extends State<PriorityView> {
  void checkBoxChanged(bool? value, index) {
    setState(() {
      toDoListObjects[index][2] = !toDoListObjects[index][2];

      //adding the completed task into completed tasks list
      completedTodos.add(toDoListObjects[index]);
      toDoListObjects.removeAt(index);
    });
  }

  void delTask(int index) {
    setState(() {
      toDoListObjects.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 48, 48, 48),
      appBar: AppBar(
        title: const Text(
          'Priority View',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.grey[900],
        elevation: 0,
      ),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 7),
          child: Align(
            alignment: Alignment.center,
            child: SizedBox(
              width: 390,
              child: DropdownButtonFormField2(
                value: selectedValuePView,
                onChanged: (value) {
                  setState(() {
                    selectedValuePView = value as String;
                  });
                },
                dropdownDecoration: BoxDecoration(
                    borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(6), bottom: Radius.circular(20)),
                    color: Colors.grey.shade700),
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    filled: true,
                    fillColor: Colors.grey.shade800),
                items: sortingListItems
                    .map((item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: const TextStyle(
                                fontSize: 14, color: Colors.white),
                          ),
                        ))
                    .toList(),
                hint: const Text(
                  "Sort",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ),

        //list builder for medium priority tasks
        if (selectedValuePView == "Medium") ...[
          ListView.builder(
            shrinkWrap: true,
            itemCount: mediumPriority.length,
            itemBuilder: (context, index) {
              return ToDoList(
                taskName: mediumPriority[index][0],
                priority: mediumPriority[index][1],
                taskCompleted: mediumPriority[index][2],
                description: mediumPriority[index][3],
                onChanged: (value) => checkBoxChanged(value, index),
                onDel: (context) => delTask(index),
              );
            },
          ),
        ],

        //list builder for high priority tasks
        if (selectedValuePView == "High") ...[
          ListView.builder(
            shrinkWrap: true,
            itemCount: highPriority.length,
            itemBuilder: (context, index) {
              return ToDoList(
                taskName: highPriority[index][0],
                priority: highPriority[index][1],
                taskCompleted: highPriority[index][2],
                description: highPriority[index][3],
                onChanged: (value) => checkBoxChanged(value, index),
                onDel: (context) => delTask(index),
              );
            },
          ),
        ],

        //list builder for low priority tasks
        if (selectedValuePView == "Low") ...[
          ListView.builder(
            shrinkWrap: true,
            itemCount: lowPriority.length,
            itemBuilder: (context, index) {
              return ToDoList(
                taskName: lowPriority[index][0],
                priority: lowPriority[index][1],
                taskCompleted: lowPriority[index][2],
                description: lowPriority[index][3],
                onChanged: (value) => checkBoxChanged(value, index),
                onDel: (context) => delTask(index),
              );
            },
          ),
        ],
      ]),
    );
  }
}
