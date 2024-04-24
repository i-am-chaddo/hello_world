import 'package:flutter/material.dart';
import 'post.dart';
import 'post_list.dart';
import 'input_text.dart';

class HomePage extends StatefulWidget {
  final String name;

  const HomePage(this.name, {super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Post> posts = [];

  void newPost(String text) {
    setState(() {
      posts.add(Post(text, widget.name));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: const Text("Hello World !"),
          backgroundColor: Colors.greenAccent,
        ),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              Expanded(child: PostList(posts)),
              TextInput(newPost)
            ],
          ),
        )));
  }
}
