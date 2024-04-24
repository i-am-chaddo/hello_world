import 'package:flutter/material.dart';
import 'package:hello_world/home_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: const Text("Login !"),
          backgroundColor: Colors.greenAccent,
        ),
        body: const SafeArea(
          child: Body(),
        ));
  }
}

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late String name;
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        const BorderSide(width: 2, color: Colors.black)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        const BorderSide(width: 2, color: Colors.black)),
                prefixIcon: const Icon(Icons.person),
                labelText: "Type Your Name Here...",
                labelStyle: const TextStyle(color: Colors.black),
                border: const OutlineInputBorder(
                    borderSide:
                        BorderSide(width: 5, color: Colors.greenAccent)),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.login_rounded),
                  tooltip: "Submit",
                  onPressed: click,
                )),
          ),
        ));
  }

  void click() {
    name = controller.text.trim();
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomePage(name)));
  }
}
