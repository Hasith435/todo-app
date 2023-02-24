import 'package:flutter/material.dart';
import 'package:todo_app/pages/home_page.dart';
import 'package:todo_app/utils/error_messages.dart';

String userName = "0";

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final userNameController = TextEditingController();
  bool showErrorMsg = false;

  void openHomePage() {
    userName = userNameController.value.text;
    if (userName != "") {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (BuildContext context) {
        return const HomePage();
      }));
    }
    if (userName == "") {
      setState(() {
        showErrorMsg = true;
      });
    }
    debugPrint(showErrorMsg.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 48, 48, 48),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 60,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 23),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Hello,',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 60,
                      color: Colors.white),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 23),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Welcome!',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 60,
                      color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: TextField(
                style: const TextStyle(color: Colors.white),
                controller: userNameController,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[600],
                    hintText: "Enter your name",
                    hintStyle: const TextStyle(color: Colors.white),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.white))),
              ),
            ),

            //sized box
            const SizedBox(
              height: 10,
            ),
            //error message
            if (showErrorMsg == true)
              ErrorMsg(errorMsg: 'Field cannot be left Empty'),

            //enter button
            Center(
              child: GestureDetector(
                onTap: openHomePage,
                child: Container(
                  padding: const EdgeInsets.only(
                      top: 10, bottom: 10, left: 151, right: 151),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white),
                  child: const Text(
                    'Enter',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 26),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
