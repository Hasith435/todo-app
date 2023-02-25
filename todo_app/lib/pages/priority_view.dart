import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:todo_app/pages/home_page.dart';
import 'package:todo_app/utils/dialog_box.dart';
import 'package:todo_app/utils/drawer.dart';
import 'package:todo_app/utils/todo_list_container.dart';

String? selectedValuePView;

List sortingListItems = ["All", "High", "Medium", "Low"];

class PriorityView extends StatefulWidget {
  const PriorityView({super.key});

  @override
  State<PriorityView> createState() => _PriorityViewState();
}

class _PriorityViewState extends State<PriorityView> {
  void checkBoxChanged(bool? value, index, priority) {
    setState(() {
      toDoListObjects[index][2] = !toDoListObjects[index][2];

      //adding the completed task into completed tasks list
      completedTodos.add(toDoListObjects[index]);

      if (priority == "High") {
        highPriority.removeAt(index);
        toDoListObjects.removeAt(index);
      } else if (priority == "Medium") {
        mediumPriority.removeAt(index);
        toDoListObjects.removeAt(index);
      } else if (priority == "Low") {
        lowPriority.removeAt(index);
        toDoListObjects.removeAt(index);
      }
    });
  }

  void delTask(int index, priority) {
    setState(() {
      toDoListObjects.removeAt(index);
      if (priority == "High") {
        highPriority.removeAt(index);
      } else if (priority == "Medium") {
        mediumPriority.removeAt(index);
      } else if (priority == "Low") {
        lowPriority.removeAt(index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      backgroundColor: const Color.fromARGB(255, 48, 48, 48),
      appBar: AppBar(
        title: const Text(
          'Priority View',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.grey[900],
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(children: [
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
              physics: const NeverScrollableScrollPhysics(),
              itemCount: mediumPriority.length,
              itemBuilder: (context, index) {
                return ToDoList(
                  taskName: mediumPriority[index][0],
                  priority: mediumPriority[index][1],
                  taskCompleted: mediumPriority[index][2],
                  description: mediumPriority[index][3],
                  dueDate: mediumPriority[index][4].toString(),
                  onChanged: (value) =>
                      checkBoxChanged(value, index, mediumPriority[index][1]),
                  onDel: (context) => delTask(index, mediumPriority[index][1]),
                );
              },
            ),
          ],

          //list builder for high priority tasks
          if (selectedValuePView == "High") ...[
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: highPriority.length,
              itemBuilder: (context, index) {
                return ToDoList(
                  taskName: highPriority[index][0],
                  priority: highPriority[index][1],
                  taskCompleted: highPriority[index][2],
                  description: highPriority[index][3],
                  dueDate: highPriority[index][4].toString(),
                  onChanged: (value) =>
                      checkBoxChanged(value, index, highPriority[index][1]),
                  onDel: (context) => delTask(index, highPriority[index][1]),
                );
              },
            ),
          ],

          //list builder for low priority tasks
          if (selectedValuePView == "Low") ...[
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: lowPriority.length,
              itemBuilder: (context, index) {
                return ToDoList(
                  taskName: lowPriority[index][0],
                  priority: lowPriority[index][1],
                  taskCompleted: lowPriority[index][2],
                  description: lowPriority[index][3],
                  dueDate: lowPriority[index][4].toString(),
                  onChanged: (value) =>
                      checkBoxChanged(value, index, lowPriority[index][1]),
                  onDel: (context) => delTask(index, lowPriority[index][2]),
                );
              },
            ),
          ],
        ]),
      ),
    );
  }
}
