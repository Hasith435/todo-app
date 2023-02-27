import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:todo_app/pages/home_page.dart';
import 'package:todo_app/utils/dialog_box.dart';
import 'package:todo_app/utils/drawer.dart';
import 'package:todo_app/utils/todo_list_container.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/data/database.dart';

String? selectedValuePView;
bool showHighImportanceTasks = false;

class PriorityView extends StatefulWidget {
  const PriorityView({super.key});

  @override
  State<PriorityView> createState() => _PriorityViewState();
}

class _PriorityViewState extends State<PriorityView> {
  ToDoDateBase db = ToDoDateBase();

  @override
  void initState() {
    // TODO: implement initState
    db.loadData();
  }

  void checkBoxChanged(bool? value, index, priority) {
    setState(() {
      db.completedTodos.add(db.toDoListObjects[index]);
      db.highPriority.removeAt(index);
      db.toDoListObjects.removeAt(index);
    });
    db.updateDateBase();
  }

  void delTask(int index, priority) {
    setState(() {
      if (priority == "High") {
        db.highPriority.removeAt(index);
      } else if (priority == "Low") {
        db.lowPriority.removeAt(index);
      }
      db.toDoListObjects.removeAt(index);
    });
    db.updateDateBase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      backgroundColor: const Color.fromARGB(255, 48, 48, 48),
      appBar: AppBar(
        title: const Text(
          'Important tasks',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.grey[900],
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          //list builder for high priority tasks
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: db.highPriority.length,
            itemBuilder: (context, index) {
              return ToDoList(
                taskName: db.highPriority[index][0],
                priority: db.highPriority[index][1],
                taskCompleted: db.highPriority[index][2],
                description: db.highPriority[index][3],
                dueDate: db.highPriority[index][4].toString(),
                unformattedDueDate: db.highPriority[index][5],
                showDueDateWarningToday: showDueDateWarningToday,
                showDueDateWarningTomorrow: showDueDateWarningTomorrow,
                index: index,
                onChanged: (value) =>
                    checkBoxChanged(value, index, db.highPriority[index][1]),
                onDel: (context) => delTask(index, db.highPriority[index][1]),
              );
            },
          ),
        ]),
      ),
    );
  }
}
