import 'package:flutter/material.dart';

class DescriptionDialog extends StatelessWidget {
  final taskName;
  final dueDate;
  final priority;
  final description;

  const DescriptionDialog(
      {super.key,
      required this.taskName,
      required this.dueDate,
      required this.priority,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
        builder: (BuildContext context, setState) => AlertDialog(
              backgroundColor: Colors.grey.shade800,
              content: SizedBox(
                height: 200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //task name
                    Text(
                      '$taskName:',
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.bold),
                    ),

                    const SizedBox(
                      height: 10,
                    ),
                    //Due date
                    Text(
                      'Due Date: $dueDate',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                    //priority
                    Text(
                      'Priority: $priority',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                    //description
                    Text(
                      'Desciption: $description',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
            ));
  }
}
