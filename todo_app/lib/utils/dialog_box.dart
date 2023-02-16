import 'package:flutter/material.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;

  DialogBox({super.key, required this.controller, required this.onSave});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.grey,
      content: SizedBox(
        height: 130,
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
    );
  }
}
