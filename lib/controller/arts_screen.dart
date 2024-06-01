import 'package:flutter/material.dart';

class ArtsScreen extends StatefulWidget {
  const ArtsScreen({super.key});

  @override
  State<ArtsScreen> createState() => _ArtsScreenState();
}

class _ArtsScreenState extends State<ArtsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child:Text("arts"),
        color: Colors.red,

      ),

    );
  }
}
