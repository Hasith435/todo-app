import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/pages/home_page.dart';
import 'package:todo_app/pages/completed_tasks.dart';
import 'package:todo_app/pages/login_page.dart';
import 'package:after_layout/after_layout.dart';

void main() {
  runApp(const TodoApp());
}

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.grey),
      home: const LoginPage(),
    );
  }
}
