import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_app/pages/edit_todo_page.dart';
import 'package:todo_app/pages/home_page.dart';
import 'package:todo_app/pages/edit_todo_page.dart';
import 'package:todo_app/utils/dialog_box.dart';
import 'package:todo_app/utils/dialog_box_todo_description.dart';

TextEditingController taskTitleController = TextEditingController();
TextEditingController taskDescriptionController = TextEditingController();

//this is the todolist container for the today page
class ToDoList extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  final String priority;
  final String description;
  final String dueDate;
  final int index;
  bool showDueDateWarningTomorrow;
  bool showDueDateWarningToday;
  final DateTime unformattedDueDate;
  Function(BuildContext)? onDel;
  Function(bool?)? onChanged;

  ToDoList(
      {super.key,
      required this.taskName,
      required this.taskCompleted,
      required this.priority,
      required this.description,
      required this.dueDate,
      required this.index,
      required this.unformattedDueDate,
      required this.onDel,
      required this.showDueDateWarningTomorrow,
      required this.showDueDateWarningToday,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 8),
        child: Slidable(
          startActionPane: ActionPane(
            motion: const StretchMotion(),
            children: [
              SlidableAction(
                onPressed: (context) {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return const EditTask();
                  }));

                  editPageTaskTitleController.text = taskName;
                  editPageTaskDescriptionController.text = description;
                  editTodoPrioritySelectedValue = priority;
                  dateTimeEditPage = unformattedDueDate;
                  taskIndex = index;
                },
                icon: Icons.edit,
                backgroundColor: Colors.blue.shade400,
                borderRadius: BorderRadius.circular(12),
              )
            ],
          ),
          endActionPane: ActionPane(
            motion: const StretchMotion(),
            children: [
              SlidableAction(
                onPressed: onDel,
                icon: Icons.delete,
                backgroundColor: Colors.red.shade400,
                borderRadius: BorderRadius.circular(12),
              )
            ],
          ),
          child: InkWell(
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.grey[800]),
              child: Row(
                children: [
                  Checkbox(
                    value: taskCompleted,
                    onChanged: onChanged,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        taskName,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                      Row(children: [
                        Text(
                          "Due on: $dueDate",
                          style:
                              const TextStyle(color: Colors.grey, fontSize: 17),
                        ),
                        if (showDueDateWarningTomorrow == true) ...[
                          const Text(
                            "DUE TOMORROW",
                            style: TextStyle(
                                color: Colors.yellow,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                        ] else if (showDueDateWarningToday == true) ...[
                          const Text(
                            "DUE TODAY",
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ])
                    ],
                  ),

                  const Spacer(),
                  //text for the todo priority
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: Text(
                      "Importance: $priority",
                      textAlign: TextAlign.right,
                      style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return DescriptionDialog(
                      taskName: taskName,
                      priority: priority,
                      dueDate: dueDate,
                      description: description,
                    );
                  });
            },
          ),
        ));
  }
}

//this is the todolist container for the completed page
class ToDoListCompleted extends StatelessWidget {
  final String taskName;

  const ToDoListCompleted({super.key, required this.taskName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        height: 60,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), color: Colors.grey[700]),
        child: Row(
          children: [
            Text(
              taskName,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
