import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

String? selectedValue;

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;

  List priorities = ["Low", "Medium", "High"];

  DialogBox({super.key, required this.controller, required this.onSave});

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setState) => AlertDialog(
        backgroundColor: Colors.grey,
        content: SizedBox(
          height: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //text entry field
              TextFormField(
                controller: controller,
                decoration: InputDecoration(
                    hintText: "Enter task name",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),

              //priority picker
              Align(
                  alignment: Alignment.centerLeft,
                  child: DropdownButtonFormField2(
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                    isExpanded: true,
                    dropdownDecoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(20)),
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

              //date picker

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
