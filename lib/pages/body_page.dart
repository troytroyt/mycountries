import 'package:calculator/components/my_button.dart';
import 'package:flutter/material.dart';

class BodyPage extends StatefulWidget {
  const BodyPage({super.key});

  @override
  State<BodyPage> createState() => _BodyPageState();
}

class _BodyPageState extends State<BodyPage> {
  final num1Controller = TextEditingController();
  final num2Controller = TextEditingController();

  Widget _input(String text, TextEditingController controller) {
    return TextField(
      decoration: InputDecoration(
        border: const UnderlineInputBorder(),
        labelText: text,
        labelStyle: const TextStyle(color: Colors.black54),
      ),
      style: const TextStyle(color: Colors.black),
      controller: controller,
    );
  }

  double result = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
          child: Column(
            children: [
              // result
              Center(
                child: Text(
                  "$result",
                  style: const TextStyle(fontSize: 30, color: Colors.black),
                ),
              ),

              // spacing
              const SizedBox(
                height: 20,
              ),

              // text input 1
              _input("enter number", num1Controller),

              // spacing
              const SizedBox(
                height: 20,
              ),

              // text input 2
              _input("enter number", num2Controller),

              // spacing
              const SizedBox(
                height: 50,
              ),

              // add button
              MyButton(
                name: "add",
                onTap: () {
                  String text1 = num1Controller.text;
                  String text2 = num2Controller.text;

                  if (parseDouble(text1) && parseDouble(text2)) {
                    double num1 = double.parse(text1);
                    double num2 = double.parse(text2);

                    setState(() {
                      result = num1 + num2;
                    });

                    num1Controller.clear();
                    num2Controller.clear();
                  } else {
                    mySnackBar("Invalid Input");
                  }
                },
              ),

              // subtract button
              MyButton(
                  name: "subtract",
                  onTap: () {
                    String text1 = num1Controller.text;
                    String text2 = num2Controller.text;

                    if (parseDouble(text1) && parseDouble(text2)) {
                      double num1 = double.parse(text1);
                      double num2 = double.parse(text2);

                      setState(() {
                        result = num1 - num2;
                      });

                      num1Controller.clear();
                      num2Controller.clear();
                    } else {
                      mySnackBar("Invalid Input");
                    }
                  }),

              // multiply button
              MyButton(
                  name: "multiply",
                  onTap: () {
                    String text1 = num1Controller.text;
                    String text2 = num2Controller.text;

                    if (parseDouble(text1) && parseDouble(text2)) {
                      double num1 = double.parse(text1);
                      double num2 = double.parse(text2);

                      setState(() {
                        result = num1 * num2;
                      });

                      num1Controller.clear();
                      num2Controller.clear();
                    } else {
                      mySnackBar("Invalid Input");
                    }
                  }),

              // divide button
              MyButton(
                  name: "divide",
                  onTap: () {
                    String text1 = num1Controller.text;
                    String text2 = num2Controller.text;

                    if (parseDouble(text1) && parseDouble(text2)) {
                      double num1 = double.parse(text1);
                      double num2 = double.parse(text2);

                      if (num2 == 0) {
                        mySnackBar("Cannot divide by zero");
                        return;
                      }

                      setState(() {
                        result = num1 / num2;
                      });

                      num1Controller.clear();
                      num2Controller.clear();
                    } else {
                      mySnackBar("Invalid Input");
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }

  // utilities
  void mySnackBar(String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Center(child: Text(text)),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  bool parseDouble(String text) {
    if (text.isEmpty) return false;

    double? value = double.tryParse(text);
    return value != null;
  }
}