import 'package:flutter/material.dart';
import 'package:grad_project/basic_screen.dart';
import 'package:grad_project/funding_screen.dart';
import 'package:grad_project/payment_screen.dart';
import 'package:grad_project/reward_screen.dart';

class StoryScreen extends StatefulWidget {
  const StoryScreen({super.key});

  @override
  State<StoryScreen> createState() => _StoryScreenState();
}

class _StoryScreenState extends State<StoryScreen> {

  TextEditingController StoryTextEditingController = TextEditingController();
  TextEditingController RiskTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              SizedBox(
                height: 5,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  IconButton(onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BasicScreen(),
                        ));
                  }, icon: Image.asset("assets/images/basic.png"),),

                  SizedBox(width: 20,),

                  IconButton( onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FundingScreen(),
                        ));
                  }, icon: Image.asset("assets/images/funding.png",) ,),

                  SizedBox(width: 20,),

                  IconButton(onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RewardScreen(),
                        ));
                  }, icon: Image.asset("assets/images/reward.png"),),

                  SizedBox(width: 20,),

                  IconButton(onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => StoryScreen(),
                        ));
                  }, icon: Image.asset("assets/images/story.png"),),

                  SizedBox(width: 20,),

                  IconButton(onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PaymentScreen(),
                        ));
                  }, icon: Image.asset("assets/images/payment.png"),),
                ],
              ),

              SizedBox(
                height: 30,
              ),
              Text(
                'Interduce your project',
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontFamily: 'Orelega One',
                  fontWeight: FontWeight.bold,
                  height: 0,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Divider(
                color: Colors.black,
                indent: 30,
                endIndent: 30,
              ),
              SizedBox(
                height: 30,
              ),


              Text(
                'Project story',
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontFamily: 'Orelega One',
                  fontWeight: FontWeight.bold,
                  height: 0,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 200,
                child: TextField(
                  maxLines: 5,
                  maxLength: 20,
                  controller: StoryTextEditingController,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    filled: true,
                    fillColor: Color(0xBA495E57),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Divider(
                color: Colors.black,
                indent: 30,
                endIndent: 30,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Risks and challenges',
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontFamily: 'Orelega One',
                  fontWeight: FontWeight.bold,
                  height: 0,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 200,
                child: TextField(
                  maxLines: 5,
                  maxLength: 20,
                  controller: RiskTextEditingController,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    filled: true,
                    fillColor: Color(0xBA495E57),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),


              Padding(
                padding: const EdgeInsets.only(left: 200),
                child: Container(
                  height: 50,
                  width: 200,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PaymentScreen(),
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
                    child: Text("Next",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: Colors.white,
                      ),),),
                ),
              ),



            ],
          ),
        ),
      ),
    );
  }
}
