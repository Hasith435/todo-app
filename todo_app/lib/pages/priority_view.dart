import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

String? selectedValue2;

List sortingListItems = [
  "All",
  "High Priority",
  "Medium priority",
  "Low priority"
];

class PriorityView extends StatefulWidget {
  const PriorityView({super.key});

  @override
  State<PriorityView> createState() => _PriorityViewState();
}

class _PriorityViewState extends State<PriorityView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 48, 48, 48),
      appBar: AppBar(
        title: const Text(
          'Priority View',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.grey[900],
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 7),
            child: Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: 390,
                child: DropdownButtonFormField2(
                  value: selectedValue2,
                  onChanged: (value) {
                    setState(() {
                      selectedValue2 = value as String;
                    });
                  },
                  dropdownDecoration: BoxDecoration(
                      borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(6), bottom: Radius.circular(20)),
                      color: Colors.grey.shade700),
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      filled: true,
                      fillColor: Colors.grey.shade800),
                  items: sortingListItems
                      .map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: const TextStyle(
                                  fontSize: 14, color: Colors.white),
                            ),
                          ))
                      .toList(),
                  hint: const Text(
                    "Sort",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
