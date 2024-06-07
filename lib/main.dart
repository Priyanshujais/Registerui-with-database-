import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'dbhelper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  TextEditingController name = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                  child: SizedBox(
                height: 150,
              )),
              Image.asset("assets/images/logo.png"),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    " Create an account",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        // color: Colors.black87.withOpacity(2.0),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                  height: 60,
                  width: 350,
                  // decoration: BoxDecoration(
                  //   borderRadius: BorderRadius.circular(25),
                  //   border: Border.all(color: Colors.grey.withOpacity(.4)),
                  // ),
                  child: UiHelper.customTextField(name, "Name", Icons.person)),
              SizedBox(height: 20),
              Container(
                width: 350,
                height: 60,
                // decoration: BoxDecoration(
                //   borderRadius: BorderRadius.circular(25),
                //   border: Border.all(color: Colors.grey.withOpacity(.4)),
                // ),
                child: UiHelper.customTextField(
                    emailController, "Email", Icons.email),
              ),
              SizedBox(height: 20),
              Container(
                width: 350,
                height: 60,
                // decoration: BoxDecoration(
                //   borderRadius: BorderRadius.circular(25),
                //   border: Border.all(color: Colors.grey.withOpacity(.4)),
                // ),
                child: UiHelper.customTextField(
                    passwordController, "Password", Icons.lock),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: 350,
                height: 60,
                // decoration: BoxDecoration(
                //   borderRadius: BorderRadius.circular(25),
                //   border: Border.all(color: Colors.grey.withOpacity(.4)),
                // ),
                child: UiHelper.customTextField(
                  phone,
                  "Mobile No",
                  Icons.call_rounded,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: 300,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    addData(
                        name.text.toString(),
                        emailController.text.toString(),
                        passwordController.text.toString(),
                        phone.text.toString());
                  },
                  child: Text(
                    "Register Your Self",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: CupertinoColors.white),
                  ),
                  style: ButtonStyle(
                    backgroundColor:
                        WidgetStateProperty.all<Color>(Color(0xFF87ceeb)),
                    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
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

class UiHelper {
  static Widget customTextField(
      TextEditingController controller, String text, IconData iconData) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: text,
        suffixIcon: Icon(iconData),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    );
  }
}

void addData(
    String name, String email, String password, String mobileNo) async {
  if (name.isEmpty || email.isEmpty || password.isEmpty || mobileNo.isEmpty) {
    log("Please enter all the details");
  } else {
    await DBHelper().addData(name, email, password, mobileNo);
    log("data inserted");
  }
}
