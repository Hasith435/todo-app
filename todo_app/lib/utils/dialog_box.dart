import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String? selectedValue;
bool showDate = false;
DateTime _dateTime = DateTime(2023);
String formattedDateTime =
    "${_dateTime.day} - ${_dateTime.month} - ${_dateTime.year}";

class DialogBox extends StatelessWidget {
  final controller;
  final controlletDescrition;
  VoidCallback onSave;

  List priorities = ["High", "Medium", "Low"];

  DialogBox({
    super.key,
    required this.controller,
    required this.controlletDescrition,
    required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setState) => AlertDialog(
        backgroundColor: Colors.grey,
        content: SizedBox(
          height: 320,
          width: 100,
          child: Column(
            children: [
              //Task name entry field
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: TextFormField(
                  controller: controller,
                  decoration: InputDecoration(
                      hintText: "Enter task name",
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
              ),

              //priority picker
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: DropdownButtonFormField2(
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                      isExpanded: true,
                      dropdownDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20)),
                      value: selectedValue,
                      onChanged: (value) {
                        setState(() {
                          selectedValue = value as String;
                        });
                      },
                      items: priorities
                          .map((item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ))
                          .toList(),
                      hint: const Text("Choose todo priority"),
                    )),
              ),

              //Task Description text entry field
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: TextFormField(
                  controller: controlletDescrition,
                  decoration: InputDecoration(
                      hintText: "Enter task description",
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      )),
                ),
              ),

              if (showDate == true) ...[
                Text("Selected Date: $formattedDateTime"),
              ],

              //date picker
              SizedBox(
                width: 3500,
                child: ElevatedButton(
                  onPressed: () async {
                    DateTime? _newDate = await showDatePicker(
                        context: context,
                        initialDate: _dateTime,
                        firstDate: _dateTime,
                        lastDate: DateTime(3000));

                    if (_newDate != null) {
                      setState(() {
                        _dateTime = _newDate;
                        showDate = true;
                      });
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                  child: const Text('Add Date'),
                ),
              ),

              //save and cancel button
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  //save button
                  ElevatedButton(
                    onPressed: onSave,
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 130, 241, 133)),
                    child: const Text('Save'),
                  ),

                  const SizedBox(
                    width: 8,
                  ),

                  //cancel button
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        showDate == false;
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 238, 111, 72)),
                      child: const Text('Cancel'))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
