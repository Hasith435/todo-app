import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String? selectedValue;
bool showDate = false;
bool showDateOnAllTodos = false;
DateTime dateTime = DateTime.now();

class DialogBox extends StatelessWidget {
  final controller;
  final controlletDescrition;
  VoidCallback onSave;

  List priorities = ["High", "Low"];

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
        backgroundColor: Colors.grey.shade800,
        content: SizedBox(
          height: 295,
          width: 100,
          child: SingleChildScrollView(
            child: Column(
              children: [
                //Task name entry field
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: TextFormField(
                    cursorColor: Colors.white,
                    controller: controller,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        hintText: "Enter task title",
                        filled: true,
                        fillColor: Colors.grey.shade800,
                        hintStyle: const TextStyle(color: Colors.white)),
                  ),
                ),

                //priority picker
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: DropdownButtonFormField2(
                        iconEnabledColor: Colors.white,
                        iconSize: 25,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey.shade800,
                        ),
                        dropdownDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey.shade700),
                        value: selectedValue,
                        onChanged: (value) {
                          setState(() {
                            selectedValue = value as String;
                          });
                        },
                        isExpanded: false,
                        items: priorities
                            .map((item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(
                                    item,
                                    style: const TextStyle(
                                        fontSize: 14, color: Colors.white),
                                  ),
                                ))
                            .toList(),
                        hint: const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Choose Priority level",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      )),
                ),

                //Task Description text entry field
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: TextFormField(
                    style: const TextStyle(color: Colors.white),
                    controller: controlletDescrition,
                    decoration: InputDecoration(
                        hintText: "Enter task description",
                        filled: true,
                        fillColor: Colors.grey.shade800,
                        hintStyle: const TextStyle(color: Colors.white)),
                  ),
                ),

                Text(
                  "Selected Date: ${dateTime.day} - ${dateTime.month} - ${dateTime.year}",
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),

                //date picker
                SizedBox(
                  width: 3500,
                  child: ElevatedButton(
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
                        backgroundColor: Colors.blue.shade400,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                    child: const Text(
                      'Select Due Date',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),

                //save and cancel button
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //save button
                    SizedBox(
                      width: 110,
                      child: ElevatedButton(
                        onPressed: onSave,
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey.shade900),
                        child: const Text(
                          'Save',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),

                    const SizedBox(
                      width: 8,
                    ),

                    //cancel button
                    SizedBox(
                      width: 110,
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            showDate == false;
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white),
                          child: const Text(
                            'Cancel',
                            style: TextStyle(color: Colors.black),
                          )),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
