import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grad_project/controller/home_screen.dart';
import 'package:grad_project/model/signin_screen.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController EmailTextEditingController = TextEditingController();
  TextEditingController FnameTextEditingController = TextEditingController();
  TextEditingController LnameTextEditingController = TextEditingController();
  TextEditingController PassTextEditingController = TextEditingController();
  bool showErrorEmail = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 100, bottom: 25),
              child: Image.asset(
                "assets/images/Frame.png",
                height: 200,
                width: 200,
              ),
            ),
            Text(
              'Create a New Account',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF01040F),
                fontSize: 34,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: TextField(
                controller: EmailTextEditingController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  label: Text(
                    "Email",
                    style: TextStyle(
                      color: Color(0xFF505050),
                      fontSize: 15,
                      //fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      //height: 0,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  prefixIcon: Icon(
                    Icons.email,
                    color: Colors.white,
                  ),
                  contentPadding: EdgeInsets.all(3),
                  hintText: "osama@gmail.com",
                  filled: true,
                  fillColor: Color(0xBA495E57),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: TextField(
                controller: FnameTextEditingController,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  label: Text(
                    "First Name",
                    style: TextStyle(
                      color: Color(0xFF505050),
                      fontSize: 15,
                      //fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      //height: 0,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  prefixIcon: Icon(
                    Icons.border_color_rounded,
                    color: Colors.white,
                  ),
                  contentPadding: EdgeInsets.all(3),
                  hintText: "osama",
                  filled: true,
                  fillColor: Color(0xBA495E57),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: TextField(
                controller: LnameTextEditingController,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  label: Text(
                    "Last Name",
                    style: TextStyle(
                      color: Color(0xFF505050),
                      fontSize: 15,
                      //fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      //height: 0,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  prefixIcon: Icon(
                    Icons.border_color_rounded,
                    color: Colors.white,
                  ),
                  contentPadding: EdgeInsets.all(3),
                  hintText: "sadaca",
                  filled: true,
                  fillColor: Color(0xBA495E57),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: TextField(
                controller: PassTextEditingController,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  label: Text(
                    "Password",
                    style: TextStyle(
                      color: Color(0xFF505050),
                      fontSize: 15,
                      //fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      //height: 0,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Colors.white,
                  ),
                  contentPadding: EdgeInsets.all(3),
                  hintText: "sadaca",
                  filled: true,
                  fillColor: Color(0xBA495E57),
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Center(
              child: SizedBox(
                width: 200,
                height: 50,
                child: TextButton(
                    onPressed: () async {
                      try {
                        final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                          email: EmailTextEditingController.text,
                          password: PassTextEditingController.text,
                        );
                        FirebaseAuth.instance.currentUser!.sendEmailVerification();
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SigninScreen(),
                            ));
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'weak-password') {
                          print('The password provided is too weak.');
                        } else if (e.code == 'email-already-in-use') {
                          print('The account already exists for that email.');
                        }
                      } catch (e) {
                        print(e);
                      }

                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Color(0xFFF4CE14),
                      // Button background color
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(50.0), // Button border radius
                      ),
                    ),
                    child: Text("Sign Up",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          color: Colors.white,
                        ))),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              'or sign up with:',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF01040F),
                fontSize: 17,
                // fontFamily: 'Orelega One',
                fontWeight: FontWeight.bold,
                //height: 0,
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 60,
                  height: 60,
                  // color: Color(0xBA495E57),
                  decoration: BoxDecoration(
                    color: Color(0xFF495E57),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.transparent,
                      width: 2,
                    ),
                  ),
                  child: IconButton(
                    icon: Image.asset("assets/images/facebook icon.png"),
                    onPressed: () {
                      // Handle button tap
                      // print('IconButton tapped!');
                    },
                  ),
                ),
                SizedBox(
                  width: 22,
                ),
                Container(
                  width: 60,
                  height: 60,
                  // color: Color(0xBA495E57),
                  decoration: BoxDecoration(
                    color: Color(0xFF495E57),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.transparent,
                      width: 2,
                    ),
                  ),
                  child: IconButton(
                    icon: Image.asset("assets/images/GOOGLE ICON.png"),
                    onPressed: () {
                      // Handle button tap
                      // print('IconButton tapped!');
                    },
                  ),
                ),
                SizedBox(
                  width: 22,
                ),
                Container(
                  width: 60,
                  height: 60,
                  // color: Color(0xBA495E57),
                  decoration: BoxDecoration(
                    color: Color(0xFF495E57),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.transparent,
                      width: 2,
                    ),
                  ),
                  child: IconButton(
                    icon: Image.asset("assets/images/apple icon.png"),
                    onPressed: () {
                      // Handle button tap
                      // print('IconButton tapped!');
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Already have account? > ",
                  style: TextStyle(
                    color: Color(0xFF01040F),
                    fontSize: 15,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SigninScreen(),
                        ));
                  },
                  child: Text(
                    "SIGN IN",
                    style: TextStyle(
                      color: Color(0xFFF4CE14),
                      fontSize: 15,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
/*
Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeScreen(),
                          ));
 */
