import 'package:flutter/material.dart';
import 'package:todo_app/utils/todo_list_container.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Colors.grey,
        child: ListView(
          children: const [
            //put the account name and all the details here
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.black54),
              child: Text(
                "drawer header",
                style: TextStyle(color: Colors.white),
              ),
            ),

            //first list tile
            ListTile(
              leading: Icon(Icons.today),
              title: Text(
                'Today',
                style: TextStyle(fontSize: 17),
              ),
            )
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
        onPressed: () {},
        splashColor: Colors.black,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Column(
              children: const [
                Text(
                  "Hi (name)!",
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Text(
                  "Here are your todos for Today:",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )
              ],
            ),
          ),
          const ToDoList(),
        ],
      ),
    );
  }
}
