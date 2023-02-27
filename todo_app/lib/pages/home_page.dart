import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/data/database.dart';
import 'package:todo_app/pages/completed_tasks.dart';
import 'package:todo_app/pages/priority_view.dart';
import 'package:todo_app/utils/drawer.dart';
import 'package:todo_app/utils/todo_list_container.dart';
import 'package:todo_app/pages/completed_tasks.dart';
import 'package:todo_app/utils/dialog_box.dart';
import 'package:todo_app/pages/login_page.dart';

bool taskCheck = true;

ToDoDateBase db = ToDoDateBase();

bool showDueDateWarningTomorrow = false;
bool showDueDateWarningToday = false;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final myBox = Hive.box('myBox');

  @override
  void initState() {
    db.loadData();
  }

  final _controller = TextEditingController();
  final _controllerDescription = TextEditingController();

  bool displayTodosCompletedMsg = false;

  void checkBoxChanged(bool? value, index, priority) async {
    int iHigh = 0;
    int iLow = 0;
    var elementIndexToRemoveHigh;
    var elementIndexToRemoveLow;

    setState(() {
      // adding the completed task into completed tasks list
      db.completedTodos.add(db.toDoListObjects[index]);
      db.toDoListObjects[index][2] = !db.toDoListObjects[index][2];

      debugPrint(priority.toString());
      if (priority == "High") {
        debugPrint(db.toDoListObjects[index].toString());

        for (var elements in db.highPriority) {
          for (var innerElements in elements) {
            for (var referenceElements in db.toDoListObjects[index]) {
              if (referenceElements == innerElements) {
                iHigh += 1;
                if (iHigh == 5) {
                  elementIndexToRemoveHigh = db.highPriority.indexOf(elements);
                }
              }
            }
          }
        }

        db.highPriority.removeAt(elementIndexToRemoveHigh);

        db.toDoListObjects.removeAt(index);
        debugPrint(db.highPriority.toString());
      } else if (priority == "Low") {
        debugPrint(db.toDoListObjects[index].toString());

        for (var elements in db.lowPriority) {
          for (var innerElements in elements) {
            for (var referenceElements in db.toDoListObjects[index]) {
              if (referenceElements == innerElements) {
                iLow += 1;
                if (iLow == 5) {
                  elementIndexToRemoveLow = db.lowPriority.indexOf(elements);
                }
              }
            }
          }
        }

        db.lowPriority.removeAt(elementIndexToRemoveLow);

        db.toDoListObjects.removeAt(index);
        debugPrint(db.lowPriority.toString());
      }
    });

    db.updateDateBase();
  }

  void saveNewTask() {
    setState(() {
      db.toDoListObjects.add(
        [
          _controller.text,
          selectedValue,
          false,
          _controllerDescription.text,
          "${dateTime.day} - ${dateTime.month} - ${dateTime.year}",
          dateTime
        ],
      );

      //high priority tasks
      if (selectedValue == "High") {
        db.highPriority.add([
          _controller.text,
          selectedValue,
          false,
          _controllerDescription.text,
          "${dateTime.day} - ${dateTime.month} - ${dateTime.year}",
          dateTime
        ]);
      }

      //low priority
      else if (selectedValue == "Low") {
        db.lowPriority.add([
          _controller.text,
          selectedValue,
          false,
          _controllerDescription.text,
          "${dateTime.day} - ${dateTime.month} - ${dateTime.year}",
          dateTime
        ]);

        debugPrint('Medium: $db.lowPriority');
      }

      showDate = false;
    });

    _controller.clear();
    _controllerDescription.clear();
    Navigator.of(context).pop();
    db.updateDateBase();
  }

  void delTask(int index, priority) {
    setState(() {
      if (priority == "High") {
        db.highPriority.remove(db.toDoListObjects[index]);
      } else if (priority == "Low") {
        db.lowPriority.remove(db.toDoListObjects[index]);
      }
      db.toDoListObjects.removeAt(index);
    });
    db.updateDateBase();
  }

  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: _controller,
            controlletDescrition: _controllerDescription,
            onSave: saveNewTask,
          );
        });

    void saveEditedTask() {
      setState(() {
        db.toDoListObjects.add(
          [
            _controller.text,
            selectedValue,
            false,
            taskDescriptionController.text,
            "${dateTime.day} - ${dateTime.month} - ${dateTime.year}",
            dateTime,
          ],
        );

        //high priority tasks
        if (selectedValue == "High") {
          db.highPriority.add([
            taskTitleController.text,
            selectedValue,
            false,
            taskDescriptionController.text,
            "${dateTime.day} - ${dateTime.month} - ${dateTime.year}",
            dateTime
          ]);
        }

        //low priority
        else if (selectedValue == "Low") {
          db.lowPriority.add([
            taskTitleController.text,
            selectedValue,
            false,
            taskDescriptionController.text,
            "${dateTime.day} - ${dateTime.month} - ${dateTime.year}",
            dateTime
          ]);

          debugPrint('Medium: $db.lowPriority');
        }

        showDate = false;
      });
      db.updateDateBase();

      taskTitleController.clear();
      taskDescriptionController.clear();
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      backgroundColor: const Color.fromARGB(255, 48, 48, 48),
      appBar: AppBar(
        title: const Text(
          'All Tasks',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.grey[900],
        elevation: 0,
      ),
      floatingActionButton: SizedBox(
        width: 100,
        child: FloatingActionButton(
            isExtended: true,
            backgroundColor: Colors.grey.shade800,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            onPressed: createNewTask,
            splashColor: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                Text(
                  'Add Task',
                  style: TextStyle(color: Colors.white),
                )
              ],
            )),
      ),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                "Hi ${db.userName}!",
                style: const TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),

          const Align(
            alignment: Alignment.center,
            child: Text(
              "Here are your tasks:",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(13),
                      color: Colors.grey[800]),
                  width: 180,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "Tasks Left:",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        db.toDoListObjects.length.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(13),
                      color: Colors.grey[800]),
                  width: 180,
                  child: Column(
                    children: [
                      const Text('Important tasks:',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.bold)),
                      Text(
                        db.highPriority.length.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),

          //builder to display all the todos

          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: db.toDoListObjects.length,
            itemBuilder: (context, index) {
              return ToDoList(
                taskName: db.toDoListObjects[index][0],
                priority: db.toDoListObjects[index][1],
                taskCompleted: db.toDoListObjects[index][2],
                description: db.toDoListObjects[index][3],
                dueDate: db.toDoListObjects[index][4].toString(),
                unformattedDueDate: db.toDoListObjects[index][5],
                showDueDateWarningToday: showDueDateWarningToday,
                showDueDateWarningTomorrow: showDueDateWarningTomorrow,
                index: index,
                onChanged: (value) =>
                    checkBoxChanged(value, index, db.toDoListObjects[index][1]),
                onDel: (context) =>
                    delTask(index, db.toDoListObjects[index][1]),
              );
            },
          ),
        ]),
      ),

      // //displayed message when there are no todos
      // if (displayTodosCompletedMsg == true) ...[
      //   const Padding(
      //     padding: EdgeInsets.only(top: 250),
      //     child: SizedBox(
      //       child: Text(
      //         'All Todos completed!',
      //         style: TextStyle(color: Colors.white, fontSize: 20),
      //       ),
      //     ),
      //   ),
      // ]
      // else ...[
      //   const Text("")
      // ],
    );
  }
}
