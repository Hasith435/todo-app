import 'package:flutter/material.dart';

class ErrorMsg extends StatefulWidget {
  String errorMsg;

  ErrorMsg({super.key, required this.errorMsg});

  @override
  State<ErrorMsg> createState() => _ErrorMsgState();
}

class _ErrorMsgState extends State<ErrorMsg> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Text(
            widget.errorMsg,
            style: const TextStyle(
                color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}
