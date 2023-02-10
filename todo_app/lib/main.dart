import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:todo_app/add_task_page.dart';

void main() {
  runApp(const Todo());
}

class Todo extends StatelessWidget {
  const Todo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.grey),
      home: const RootPage(),
    );
  }
}

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      appBar: AppBar(
        title: const Text(
          "To-Do",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.grey[850],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            //container for the greeting
            Container(
              alignment: Alignment.center,
              // color: Colors.red,
              padding: const EdgeInsets.fromLTRB(20, 40, 20, 10),
              child: const Text(
                'Hi (name)',
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Lato",
                    fontWeight: FontWeight.bold,
                    fontSize: 50),
              ),
            ),

            //container for the statement
            Container(
              alignment: Alignment.center,
              // color: Colors.yellow,
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
              child: const Text(
                "Here are your Todo's for today:",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
            ),

            //container for input box
            Container(
                alignment: Alignment.bottomCenter,
                padding: const EdgeInsets.all(20),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (BuildContext context) {
                      return const AddTaskPage();
                    }));
                  },
                  child: const Text(
                    "+ Add Task",
                    style: TextStyle(fontFamily: "Lato"),
                  ),
                )),
          ],
        ),
      ),
      drawer: const NavigationDrawer(),
    );
  }
}

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({super.key});

  @override
  Widget build(BuildContext context) => Drawer(
        backgroundColor: Colors.grey[400],
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(16, 70, 2, 20),
                    child: Row(
                      children: [
                        const Icon(Icons.person),
                        const Text('Name'),
                        Divider(
                          color: Colors.grey[400],
                          thickness: 40,
                        )
                      ],
                    ),
                  ),

                  //Today button
                  ListTile(
                    leading: const Icon(Icons.today),
                    title: const Text('Today'),
                    onTap: () {},
                  ),

                  //Tomorrow button
                  ListTile(
                    leading: const Icon(Icons.turn_right),
                    title: const Text('Tomorrow'),
                    onTap: () {},
                  ),

                  //Weekly button
                  ListTile(
                    leading: const Icon(Icons.next_week),
                    title: const Text('Weekly'),
                    onTap: () {},
                  ),

                  //important button
                  ListTile(
                      leading: const Icon(Icons.label_important),
                      title: const Text('Important'),
                      onTap: () {}),
                ],
              )
            ],
          ),
        ),
      );
}
