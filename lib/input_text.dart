import 'package:flutter/material.dart';

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
    FocusScope.of(context).unfocus();
    widget.callabck(controller.text);
    controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: controller,
        decoration: InputDecoration(
            prefixIcon: const Icon(Icons.message_rounded),
            labelText: "Type Something Here...",
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(width: 2, color: Colors.black)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(width: 2, color: Colors.black)),
            labelStyle: const TextStyle(color: Colors.black),
            suffixIcon: IconButton(
              icon: const Icon(Icons.send_rounded),
              tooltip: "Send",
              onPressed: click,
            )));
  }
}
