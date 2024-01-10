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
        content: IntrinsicWidth(
          child: SizedBox(
            height: 185,
            width: 1000,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  //Task name entry field
                  SizedBox(
                    width: 2000,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 0),
                      child: TextFormField(
                        cursorColor: Colors.white,
                        controller: controller,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 35,
                            fontWeight: FontWeight.bold),
                        decoration: InputDecoration(
                          hintText: "Task Name",
                          filled: true,
                          fillColor: Colors.grey.shade800,
                          hintStyle: TextStyle(
                              color: Colors.grey.shade500,
                              fontWeight: FontWeight.bold),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),

                  //Task Description text entry field
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: TextFormField(
                      style: const TextStyle(color: Colors.white, fontSize: 25),
                      controller: controlletDescrition,
                      decoration: InputDecoration(
                        hintText: "Description",
                        prefix: const Padding(
                          padding: EdgeInsets.only(left: 3),
                        ),
                        filled: true,
                        fillColor: Colors.grey.shade800,
                        hintStyle: TextStyle(
                            color: Colors.grey.shade500, fontSize: 25),
                        border: InputBorder.none,
                      ),
                    ),
                  ),

                  //priority picker
                  // Padding(
                  //   padding: const EdgeInsets.only(bottom: 8),
                  //   child: Align(
                  //       alignment: Alignment.centerLeft,
                  //       child: DropdownButtonFormField2(
                  //         iconEnabledColor: Colors.white,
                  //         iconSize: 25,
                  //         decoration: InputDecoration(
                  //             filled: true,
                  //             fillColor: Colors.grey.shade800,
                  //             border: InputBorder.none),
                  //         dropdownDecoration: BoxDecoration(
                  //             borderRadius: BorderRadius.circular(20),
                  //             color: Colors.grey.shade700),
                  //         value: selectedValue,
                  //         onChanged: (value) {
                  //           setState(() {
                  //             selectedValue = value as String;
                  //           });
                  //         },
                  //         isExpanded: false,
                  //         items: priorities
                  //             .map((item) => DropdownMenuItem<String>(
                  //                   value: item,
                  //                   child: Text(
                  //                     item,
                  //                     style: const TextStyle(
                  //                         fontSize: 14, color: Colors.white),
                  //                   ),
                  //                 ))
                  //             .toList(),
                  //         hint: const Align(
                  //           alignment: Alignment.centerLeft,
                  //           child: Text(
                  //             "Choose Priority level",
                  //             style: TextStyle(color: Colors.white),
                  //           ),
                  //         ),
                  //       )),
                  // ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            backgroundColor: Colors.grey.shade700),
                        child: Row(
                          children: const [
                            Icon(Icons.flag_outlined),
                            Text(
                              "Priority",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          ],
                        ),
                      ),

                      // Text(
                      //   "Selected Date: ${dateTime.day} - ${dateTime.month} - ${dateTime.year}",
                      //   style: const TextStyle(
                      //       color: Colors.white,
                      //       fontWeight: FontWeight.bold,
                      //       fontSize: 15),
                      // ),

                      //date picker
                      ElevatedButton(
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
                            backgroundColor: Colors.grey.shade700,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20))),
                        child: Row(
                          children: const [
                            Icon(Icons.calendar_month_outlined),
                            Text(
                              'Date',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        onPressed: onSave,
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey.shade900),
                        child: const Icon(Icons.send),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
