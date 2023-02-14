import 'package:flutter/material.dart';
import 'package:todo_app/utils/todo_list_container.dart';

import '../utils/dialog_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController();

  List toDoListObjects = [];

  void checkBoxChanged(bool? value, index) {
    setState(() {
      toDoListObjects[index][1] = !toDoListObjects[index][1];
    });
  }

  void saveNewTask() {
    setState(() {
      toDoListObjects.add(
        [_controller.text, false],
      );
    });

    _controller.clear();
    Navigator.of(context).pop();
  }

  void delTask() {}

  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: _controller,
            onSave: saveNewTask,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          backgroundColor: Colors.grey,
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

              //important button
              Padding(
                padding:
                    const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.label_important),
                  label: const Text("Important"),
                ),
              ),
            ],
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 88, 88, 88),
        appBar: AppBar(
          title: const Text(
            'To-Do',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.grey[800],
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
                "Here are your todos for Today:",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: toDoListObjects.length,
              itemBuilder: (context, index) {
                return ToDoList(
                  taskName: toDoListObjects[index][0],
                  taskCompleted: toDoListObjects[index][1],
                  onChanged: (value) => checkBoxChanged(value, index),
                  onDel: delTask,
                );
              },
            ),
          ],
        ));
  }
}
