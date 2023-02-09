import 'dart:convert';

import 'package:flutter/material.dart';

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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Text(
              'HI (NAME)!',
              style: TextStyle(color: Colors.white),
            )
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
        backgroundColor: Colors.white,
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
