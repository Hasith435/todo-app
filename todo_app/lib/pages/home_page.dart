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
          ToDoList(
            taskName: "Code app",
            taskCompleted: true,
            onChanged: (p0) {},
          ),
        ],
      ),
    );
  }
}
