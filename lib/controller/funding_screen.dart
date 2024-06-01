import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:grad_project/controller/basic_screen.dart';
import 'package:grad_project/controller/payment_screen.dart';
import 'package:grad_project/view/reward_screen.dart';
import 'package:grad_project/controller/story_screen.dart';

class FundingScreen extends StatefulWidget {
  const FundingScreen({super.key});

  @override
  State<FundingScreen> createState() => _FundingScreenState();
}

class _FundingScreenState extends State<FundingScreen> {

  TextEditingController CostTextEditingController = TextEditingController();
  CollectionReference campains =
  FirebaseFirestore.instance.collection('campains');
  addCampains() async {
    //return campains
    try {
      DocumentReference respose = await campains.add({
        'goal': CostTextEditingController.text,
      });
    } catch (e) {
      print("Failed to add user: $e");
    }
  }

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
                'Let’s talk about money , plan your project’s finance ',
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
                'Funding goal',
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontFamily: 'Orelega One',
                  fontWeight: FontWeight.normal,
                  height: 0,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Goal amount',
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
                height: 60,
                child: TextField(
                  maxLength: 5,
                  controller: CostTextEditingController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: "(max.10000)",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    filled: true,
                    fillColor: Color(0xBA495E57),
                  ),
                ),
              ),


              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 200),
                child: Container(
                  height: 50,
                  width: 200,
                  child: TextButton(
                    onPressed: () {
                      addCampains();

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RewardScreen(),
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
