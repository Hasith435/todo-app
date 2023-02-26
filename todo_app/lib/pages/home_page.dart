import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:todo_app/pages/completed_tasks.dart';
import 'package:todo_app/pages/priority_view.dart';
import 'package:todo_app/utils/drawer.dart';
import 'package:todo_app/utils/todo_list_container.dart';
import 'package:todo_app/pages/completed_tasks.dart';
import 'package:todo_app/utils/dialog_box.dart';
import 'package:todo_app/pages/login_page.dart';

List completedTodos = [];
bool taskCheck = true;
List toDoListObjects = [];

List highPriority = [];
List mediumPriority = [];
List lowPriority = [];

List todayTasks = [];
List tommorowTasks = [];

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController();
  final _controllerDescription = TextEditingController();

  bool displayTodosCompletedMsg = false;

  void checkBoxChanged(bool? value, index, priority) {
    setState(() {
      toDoListObjects[index][2] = !toDoListObjects[index][2];

      //adding the completed task into completed tasks list
      completedTodos.add(toDoListObjects[index]);
      toDoListObjects.removeAt(index);
      debugPrint(priority.toString());
      if (priority == "High") {
        highPriority.removeAt(index);
      } else if (priority == "Medium") {
        mediumPriority.removeAt(index);
      } else if (priority == "Low") {
        lowPriority.removeAt(index);
      }
    });
  }

  void checkTodosCompleted() {
    if (toDoListObjects.isEmpty) {
      displayTodosCompletedMsg = true;
    }
  }

  void saveNewTask() {
    setState(() {
      toDoListObjects.add(
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
        highPriority.add([
          _controller.text,
          selectedValue,
          false,
          _controllerDescription.text,
          "${dateTime.day} - ${dateTime.month} - ${dateTime.year}",
          dateTime
        ]);
      }

      //Medium priority
      else if (selectedValue == "Medium") {
        mediumPriority.add([
          _controller.text,
          selectedValue,
          false,
          _controllerDescription.text,
          "${dateTime.day} - ${dateTime.month} - ${dateTime.year}",
          dateTime
        ]);

        debugPrint('Medium: $mediumPriority');
      }

      //low priority
      else if (selectedValue == "Low") {
        lowPriority.add([
          _controller.text,
          selectedValue,
          false,
          _controllerDescription.text,
          "${dateTime.day} - ${dateTime.month} - ${dateTime.year}",
          dateTime
        ]);

        debugPrint('Medium: $lowPriority');
      }

      showDate = false;
    });

    _controller.clear();
    _controllerDescription.clear();
    Navigator.of(context).pop();
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
        toDoListObjects.add(
          [
            _controller.text,
            selectedValue,
            false,
            taskDescriptionController.text,
            "${dateTime.day} - ${dateTime.month} - ${dateTime.year}",
            dateTime
          ],
        );

        //high priority tasks
        if (selectedValue == "High") {
          highPriority.add([
            taskTitleController.text,
            selectedValue,
            false,
            taskDescriptionController.text,
            "${dateTime.day} - ${dateTime.month} - ${dateTime.year}",
            dateTime
          ]);
        }

        //Medium priority
        else if (selectedValue == "Medium") {
          mediumPriority.add([
            taskTitleController.text,
            selectedValue,
            false,
            taskDescriptionController.text,
            "${dateTime.day} - ${dateTime.month} - ${dateTime.year}",
            dateTime
          ]);

          debugPrint('Medium: $mediumPriority');
        }

        //low priority
        else if (selectedValue == "Low") {
          lowPriority.add([
            taskTitleController.text,
            selectedValue,
            false,
            taskDescriptionController.text,
            "${dateTime.day} - ${dateTime.month} - ${dateTime.year}",
            dateTime
          ]);

          debugPrint('Medium: $lowPriority');
        }

        showDate = false;
      });

      taskTitleController.clear();
      taskDescriptionController.clear();
      Navigator.of(context).pop();
    }

    void editTask(String taskName, String description) {
      taskTitleController.text = taskName;
      taskDescriptionController.text = description;

      showDialog(
          context: context,
          builder: (context) {
            return DialogBox(
              controller: taskTitleController,
              controlletDescrition: taskDescriptionController,
              onSave: saveNewTask,
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      backgroundColor: const Color.fromARGB(255, 48, 48, 48),
      appBar: AppBar(
        title: const Text(
          'To-Do',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.grey[900],
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        splashColor: Colors.black,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                "Hi $userName!",
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
              "Here are your todos:",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),

          //builder to display all the todos

          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: toDoListObjects.length,
            itemBuilder: (context, index) {
              return ToDoList(
                taskName: toDoListObjects[index][0],
                priority: toDoListObjects[index][1],
                taskCompleted: toDoListObjects[index][2],
                description: toDoListObjects[index][3],
                dueDate: toDoListObjects[index][4].toString(),
                unformattedDueDate: toDoListObjects[index][5],
                index: index,
                onChanged: (value) =>
                    checkBoxChanged(value, index, toDoListObjects[index][1]),
                onDel: (context) => delTask(index, toDoListObjects[index][1]),
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
