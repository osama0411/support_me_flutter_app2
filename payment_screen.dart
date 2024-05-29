import 'package:flutter/material.dart';
import 'package:grad_project/add_screen.dart';
import 'package:grad_project/basic_screen.dart';
import 'package:grad_project/funding_screen.dart';
import 'package:grad_project/reward_screen.dart';
import 'package:grad_project/story_screen.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {

  TextEditingController ContactTextEditingController = TextEditingController();
  TextEditingController BankNTextEditingController = TextEditingController();
  TextEditingController FirstLastNTextEditingController = TextEditingController();
  TextEditingController AccountNTextEditingController = TextEditingController();
  TextEditingController ProjectTypeTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
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
                'Verify your details and link a bank account',
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
                'Contact e-mail',
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
                  maxLength: 20,
                  controller: ContactTextEditingController,
                  keyboardType: TextInputType.text,
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
                'Project Type (individual / busines)',
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
                  maxLength: 20,
                  controller: ProjectTypeTextEditingController,
                  keyboardType: TextInputType.text,
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
                'Bank name',
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
                  maxLength: 20,
                  controller: ContactTextEditingController,
                  keyboardType: TextInputType.text,
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
                'First / Last name',
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
                  maxLength: 20,
                  controller: ContactTextEditingController,
                  keyboardType: TextInputType.text,
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
                'Account number',
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
                  maxLength: 15,
                  controller: ContactTextEditingController,
                  keyboardType: TextInputType.number,
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
                height: 30,
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
                            builder: (context) => AddScreen(),
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
