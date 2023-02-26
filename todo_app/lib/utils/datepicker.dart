import 'package:flutter/material.dart';
import 'package:todo_app/utils/dialog_box.dart';

bool showDate = false;
bool showDateOnAllTodos = false;

class DatePicker extends StatefulWidget {
  const DatePicker({super.key});

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        final DateTime? newDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime.now(),
            lastDate: DateTime(3000));

        if (newDate != null && newDate != dateTime) {
          setState(() {
            dateTime = newDate;
            showDate = true;
            showDateOnAllTodos = true;
            debugPrint(dateTime.toString());
          });
        }
      },
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
      child: const Text('Add Date'),
    );
  }
}
