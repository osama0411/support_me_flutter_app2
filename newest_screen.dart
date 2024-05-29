import 'package:flutter/material.dart';

class NewestScreen extends StatefulWidget {
  const NewestScreen({super.key});

  @override
  State<NewestScreen> createState() => _NewestScreenState();
}

class _NewestScreenState extends State<NewestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child:Text("new"),
        color: Colors.pink,

      ),

    );
  }
}
