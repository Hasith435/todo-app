import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/utils/drawer.dart';
import 'package:todo_app/pages/home_page.dart';

TextEditingController editPageTaskTitleController = TextEditingController();

TextEditingController editPageTaskDescriptionController =
    TextEditingController();

List priorities = ["High", "Medium", "Low"];

String? editTodoPrioritySelectedValue;

bool showDate = false;
DateTime dateTimeEditPage = DateTime.now();

List editedTask = [];

int taskIndex = 0;

class EditTask extends StatefulWidget {
  const EditTask({
    super.key,
  });

  @override
  State<EditTask> createState() => _EditTaskState();
}

class _EditTaskState extends State<EditTask> {
  void addTaskToEditedTaskList() {
    editedTask.add([
      editPageTaskTitleController.text,
      editTodoPrioritySelectedValue,
      false,
      editPageTaskDescriptionController.text,
      "${dateTimeEditPage.day} - ${dateTimeEditPage.month} - ${dateTimeEditPage.year}",
      dateTimeEditPage
    ]);

    toDoListObjects[taskIndex] = editedTask[0];

    editedTask.clear();
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return const HomePage();
    }));
    showDate == false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      backgroundColor: const Color.fromARGB(255, 48, 48, 48),
      appBar: AppBar(
        title: const Text(
          'Edit Task',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.grey[900],
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          //task name label
          const Padding(
            padding: EdgeInsets.only(top: 10, left: 14, bottom: 9),
            child: Text(
              "Task Title:",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          //Task name entry field
          Padding(
            padding: const EdgeInsets.only(bottom: 8, left: 12, right: 12),
            child: TextFormField(
              cursorColor: Colors.white,
              controller: editPageTaskTitleController,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey.shade800,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12))),
            ),
          ),

          //task description label
          //task name label
          const Padding(
            padding: EdgeInsets.only(top: 10, left: 14, bottom: 9),
            child: Text(
              "Task Description:",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          //task description text entry field
          Padding(
            padding: const EdgeInsets.only(bottom: 8, left: 12, right: 12),
            child: TextFormField(
              cursorColor: Colors.white,
              controller: editPageTaskDescriptionController,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey.shade800,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12))),
            ),
          ),

          //priority label
          //task name label
          const Padding(
            padding: EdgeInsets.only(top: 10, left: 14, bottom: 9),
            child: Text(
              "Priority:",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          //priority picker
          Padding(
            padding: const EdgeInsets.only(bottom: 8, left: 12, right: 12),
            child: Align(
                alignment: Alignment.centerLeft,
                child: DropdownButtonFormField2(
                  iconEnabledColor: Colors.white,
                  iconSize: 25,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey.shade800,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12))),
                  dropdownDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey.shade700),
                  value: editTodoPrioritySelectedValue,
                  onChanged: (value) {
                    setState(() {
                      editTodoPrioritySelectedValue = value as String;
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
                      "Choose todo priority",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )),
          ),

          //date picker

          Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: Text(
              "Selected Date: ${dateTimeEditPage.day} - ${dateTimeEditPage.month} - ${dateTimeEditPage.year}",
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
          ),

          //date picker
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 12, 12, 3),
            child: SizedBox(
              width: 3500,
              child: ElevatedButton(
                onPressed: () async {
                  final DateTime? newDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime(3000));

                  if (newDate != null && newDate != dateTimeEditPage) {
                    setState(() {
                      dateTimeEditPage = newDate;
                      showDate = true;
                      debugPrint(dateTimeEditPage.toString());
                    });
                  }
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12))),
                child: const Text('Add New date',
                    style: TextStyle(color: Colors.white, fontSize: 19)),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
            child: SizedBox(
              width: 3500,
              child: ElevatedButton(
                onPressed: addTaskToEditedTaskList,
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12))),
                child: const Text(
                  "Save Edits",
                  style: TextStyle(color: Colors.white, fontSize: 19),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
