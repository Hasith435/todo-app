import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:todo_app/pages/completed_tasks.dart';
import 'package:todo_app/pages/priority_view.dart';
import 'package:todo_app/utils/todo_list_container.dart';
import 'package:todo_app/pages/completed_tasks.dart';
import 'package:todo_app/utils/dialog_box.dart';

List completedTodos = [];
bool taskCheck = true;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController();
  final _controllerDescription = TextEditingController();

  List toDoListObjects = [];
  bool displayTodosCompletedMsg = false;

  void checkBoxChanged(bool? value, index) {
    setState(() {
      toDoListObjects[index][2] = !toDoListObjects[index][2];

      //adding the completed task into completed tasks list
      completedTodos.add(toDoListObjects[index]);
      toDoListObjects.removeAt(index);
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
        [_controller.text, selectedValue, false, _controllerDescription.text],
      );

      showDate = false;
    });

    _controller.clear();
    _controllerDescription.clear();
    Navigator.of(context).pop();
  }

  void delTask(int index) {
    setState(() {
      toDoListObjects.removeAt(index);
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
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
                padding:
                    const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (BuildContext context) {
                      return const HomePage();
                    }));
                  },
                  icon: const Icon(Icons.tornado),
                  label: const Text("All Todos"),
                ),
              ),

              //today button
              Padding(
                padding:
                    const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.today),
                  label: const Text("Today"),
                ),
              ),

              //tommorrow button
              Padding(
                padding:
                    const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.turn_right),
                  label: const Text("Tommorow"),
                ),
              ),

              //weekly button
              Padding(
                padding:
                    const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.calendar_view_week),
                  label: const Text("Weekly"),
                ),
              ),
              //priority view button
              Padding(
                padding:
                    const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (BuildContext context) {
                      return const PriorityView();
                    }));
                  },
                  icon: const Icon(Icons.priority_high),
                  label: const Text("Priority View"),
                ),
              ),

              //completed button
              Padding(
                padding:
                    const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (BuildContext context) {
                      return const CompletedTasks();
                    }));
                  },
                  icon: const Icon(Icons.check),
                  label: const Text("Completed"),
                ),
              ),
            ],
          ),
        ),
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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 50),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  "Hi (name)!",
                  style: TextStyle(
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
              itemCount: toDoListObjects.length,
              itemBuilder: (context, index) {
                return ToDoList(
                  taskName: toDoListObjects[index][0],
                  priority: toDoListObjects[index][1],
                  taskCompleted: toDoListObjects[index][2],
                  description: toDoListObjects[index][3],
                  onChanged: (value) => checkBoxChanged(value, index),
                  onDel: (context) => delTask(index),
                );
              },
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
          ],
        ));
  }
}
