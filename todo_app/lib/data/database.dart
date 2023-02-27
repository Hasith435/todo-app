import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/pages/login_page.dart';

class ToDoDateBase {
  List toDoListObjects = [];
  List editedTasks = [];
  List highPriority = [];
  List lowPriority = [];
  List completedTodos = [];
  String? userName = "0";

//refrence the box
  final myBox = Hive.box('myBox');

  void loadData() {
    toDoListObjects = myBox.get("TODOLIST");
    highPriority = myBox.get("HIGHP");
    lowPriority = myBox.get("LOWP");
    userName = myBox.get("USER");
    editedTasks = myBox.get("EDITED");
    completedTodos = myBox.get("COMPLETED");
  }

  void updateDateBase() {
    myBox.put("TODOLIST", toDoListObjects);
    myBox.put("HIGHP", highPriority);
    myBox.put("LOWP", lowPriority);
    myBox.put("USER", userName);
    myBox.put("EDITED", editedTasks);
    myBox.put("COMPLETED", completedTodos);
  }
}
