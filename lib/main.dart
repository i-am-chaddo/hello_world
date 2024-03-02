import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Hello World",
      theme: ThemeData(
        primarySwatch: Colors.grey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String text = "";

  void changeText(String text) {
    setState(() {
      this.text = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text("Hello World !"),
        backgroundColor: Colors.blue[500],
      ),
      body: Column(
        children: <Widget>[TextInput(changeText), Text(text)],
      ),
    );
  }
}

class TextInput extends StatefulWidget {
  final Function(String) callabck;

  const TextInput(this.callabck, {super.key});

  @override
  State<TextInput> createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  final controller = TextEditingController();
  String text = "";

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  void click() {
    widget.callabck(controller.text);
    controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: controller,
        decoration: InputDecoration(
            prefixIcon: const Icon(Icons.message_rounded),
            labelText: "Enter Something Here...",
            suffixIcon: IconButton(
              icon: const Icon(Icons.send),
              tooltip: "Send",
              onPressed: click,
            )));
  }
}
