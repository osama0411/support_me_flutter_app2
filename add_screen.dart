import 'package:flutter/material.dart';
import 'package:grad_project/add_screen_1.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Center(
            child: Text(
              'Bring your creative project',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFFF4CE14),
                fontSize: 24,
                fontWeight: FontWeight.w400,
                height: 0.04,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'to live',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFFF4CE14),
              fontSize: 24,
              fontWeight: FontWeight.w400,
              height: 0.04,
            ),
          ),
          SizedBox(
            height: 80,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset("assets/images/add2.png"),
          ),
          SizedBox(
            height: 20,
          ),

          Text(
            'A way for every creative person to control their destiny.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontFamily: 'Orelega One',
              fontWeight: FontWeight.w400,
              height: 0,
            ),
          ),

          SizedBox(
            height: 50,
          ),

          TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddScreen11(),
                    ));
              },
              style: TextButton.styleFrom(
                backgroundColor: Color(0xFFF4CE14),
                // Button background color
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(10), // Button border radius
                ),
              ),
              child: Text("Start a project",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: Colors.white,
                  ))),
        ],
      ),
    );
  }
}
