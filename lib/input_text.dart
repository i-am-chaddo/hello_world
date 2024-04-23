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
            prefixIcon: const Icon(Icons.sms_rounded),
            labelText: "Type Something Here...",
            border: const OutlineInputBorder(
                borderSide: BorderSide(width: 5, color: Colors.greenAccent)),
            suffixIcon: IconButton(
              icon: const Icon(Icons.send_rounded),
              tooltip: "Send",
              onPressed: click,
            )));
  }
}
