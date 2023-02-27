import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/data/database.dart';
import 'package:todo_app/pages/home_page.dart';
import 'package:todo_app/utils/error_messages.dart';

ToDoDateBase db = ToDoDateBase();

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final myBox = Hive.box('myBox');

  void automaticLogin() {
    if (db.userName != null) {
      debugPrint("not null");
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (BuildContext context) {
        return const HomePage();
      }));
    }
  }

  final userNameController = TextEditingController();
  bool showErrorMsg = false;

  void openHomePage() {
    db.userName = userNameController.text;
    if (db.userName != "") {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (BuildContext context) {
        return const HomePage();
      }));
    }
    if (db.userName == "") {
      setState(() {
        showErrorMsg = true;
      });
    }
    debugPrint(showErrorMsg.toString());
    db.updateDateBase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 48, 48, 48),
      body: SingleChildScrollView(
        child: SafeArea(
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

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //enter button
                  Center(
                    child: GestureDetector(
                      onTap: openHomePage,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(25, 8, 5, 10),
                        child: Container(
                          padding: const EdgeInsets.only(
                              top: 10, bottom: 10, left: 30, right: 30),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white,
                          ),
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
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 10, bottom: 10, left: 16, right: 23),
                      child: SizedBox(
                        width: 220,
                        height: 50,
                        child: ElevatedButton(
                            onPressed: automaticLogin,
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                )),
                            child: const Text(
                              'Auto login',
                              style: TextStyle(
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            )),
                      ),
                    ),
                  ),
                ],
              ),

              const Center(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(12, 20, 12, 0),
                  child: Text(
                    "Note that automatic login can only be used after initial registration of name is done",
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 10,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
