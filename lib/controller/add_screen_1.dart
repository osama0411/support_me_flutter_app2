import 'package:flutter/material.dart';
import 'package:grad_project/controller/basic_screen.dart';
import 'package:grad_project/controller/funding_screen.dart';
import 'package:grad_project/controller/payment_screen.dart';
import 'package:grad_project/view/reward_screen.dart';
import 'package:grad_project/controller/story_screen.dart';

class AddScreen11 extends StatefulWidget {
  const AddScreen11({super.key});

  @override
  State<AddScreen11> createState() => _AddScreen11State();
}

class _AddScreen11State extends State<AddScreen11> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'Project overview',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.amber,
                fontSize: 25,
                fontFamily: 'Orelega One',
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
                height: 0,
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            children: [
              SizedBox(
                width: 20,
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BasicScreen(),
                      ));
                },
                icon: Image.asset("assets/images/basic.png"),
              ),
              SizedBox(
                width: 30,
              ),
              Text(
                'Basic',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontFamily: 'Orelega One',
                  fontWeight: FontWeight.bold,
                  height: 0,
                ),
              ),
            ],
          ),
          Divider(
            thickness: 1,
            color: Colors.black,
            height: 20,
            indent: 30,
            endIndent: 30,
          ),
          Row(
            children: [
              SizedBox(
                width: 20,
              ),
              IconButton(
                onPressed: () { Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FundingScreen(),
                    ));},
                icon: Image.asset("assets/images/funding.png"),
              ),
              SizedBox(
                width: 30,
              ),
              Text(
                'Funding',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontFamily: 'Orelega One',
                  fontWeight: FontWeight.bold,
                  height: 0,
                ),
              ),
            ],
          ),
          Divider(
            thickness: 1,
            color: Colors.black,
            height: 20,
            indent: 30,
            endIndent: 30,
          ),
          Row(
            children: [
              SizedBox(
                width: 20,
              ),
              IconButton(
                onPressed: () { Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RewardScreen(),
                    ));},
                icon: Image.asset("assets/images/reward.png"),
              ),
              SizedBox(
                width: 30,
              ),
              Text(
                'Rewards',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontFamily: 'Orelega One',
                  fontWeight: FontWeight.bold,
                  height: 0,
                ),
              ),
            ],
          ),
          Divider(
            thickness: 1,
            color: Colors.black,
            height: 20,
            indent: 30,
            endIndent: 30,
          ),
          Row(
            children: [
              SizedBox(
                width: 20,
              ),
              IconButton(
                onPressed: () { Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => StoryScreen(),
                    ));},
                icon: Image.asset("assets/images/story.png"),
              ),
              SizedBox(
                width: 30,
              ),
              Text(
                'Story',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontFamily: 'Orelega One',
                  fontWeight: FontWeight.bold,
                  height: 0,
                ),
              ),
            ],
          ),
          Divider(
            thickness: 1,
            color: Colors.black,
            height: 20,
            indent: 30,
            endIndent: 30,
          ),
          Row(
            children: [
              SizedBox(
                width: 20,
              ),
              IconButton(
                onPressed: () { Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PaymentScreen(),
                    ));},
                icon: Image.asset("assets/images/payment.png"),
              ),
              SizedBox(
                width: 30,
              ),
              Text(
                'Payment',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontFamily: 'Orelega One',
                  fontWeight: FontWeight.bold,
                  height: 0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
