import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/pages/home_page.dart';
import 'package:todo_app/pages/completed_tasks.dart';
import 'package:todo_app/pages/login_page.dart';
import 'package:after_layout/after_layout.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/data/database.dart';

ToDoDateBase db = ToDoDateBase();

void main() async {
  //init box
  await Hive.initFlutter();

  //open the box
  var box = await Hive.openBox('myBox');

  runApp(const TodoApp());
}

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),
      theme: ThemeData(brightness: Brightness.dark),
    );
  }
}
