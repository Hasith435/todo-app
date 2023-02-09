import "package:todo_app/main.dart";
import 'package:flutter/material.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({super.key});

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      appBar: AppBar(
        title: const Text(
          "Add a Task",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.grey[850],
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: SizedBox(
              width: 370,
              child: TextFormField(
                decoration: InputDecoration(
                    labelText: "Title",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0))),
              ),
            ),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: SizedBox(
              width: 370,
              child: TextFormField(
                decoration: InputDecoration(
                    labelText: "Description",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0))),
              ),
            ),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: SizedBox(
              width: 370,
              child: TextFormField(
                decoration: InputDecoration(
                    labelText: "Due date",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0))),
              ),
            ),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: SizedBox(
              width: 370,
              child: TextFormField(
                decoration: InputDecoration(
                    labelText: "Importance",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0))),
              ),
            ),
          ),
        ),
        Center(
          child: ElevatedButton(
            onPressed: () {},
            child: const Text('Add Task'),
          ),
        )
      ]),
    );
  }
}
