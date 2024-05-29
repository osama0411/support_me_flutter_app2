import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grad_project/home_screen.dart';
import 'package:grad_project/signup_screen.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  TextEditingController EmailTextEditingController = TextEditingController();
  TextEditingController PassTextEditingController = TextEditingController();
  bool showErrorEmail = false;



  Future signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    if(googleUser == null){
      return;
    }

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
     await FirebaseAuth.instance.signInWithCredential(credential);

    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ));


  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,

          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Image.asset("assets/images/Group 2.png"),
            ),
            Text(
              'Let’s Get In',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF01040F),
                fontSize: 36,
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
                  hintText: "On21#mm",
                  filled: true,
                  fillColor: Color(0xBA495E57),
                ),
              ),
            ),
            SizedBox(
              height: 34,
            ),
            Center(
              child: SizedBox(
                width: 200,
                height: 50,
                child: TextButton(
                    onPressed: () async {
                      try {
                        final credential = await FirebaseAuth.instance
                            .signInWithEmailAndPassword(
                          email: EmailTextEditingController.text,
                          password: PassTextEditingController.text,
                        );

                        if(credential.user!.emailVerified){
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomeScreen(),
                              ));
                        }else{
                          AwesomeDialog(
                            context: context,
                            dialogType: DialogType.info,
                            animType: AnimType.rightSlide,
                            title: 'Alert',
                            desc: 'please go to your email and verify',
                          ).show();
                        }
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'user-not-found') {
                          print('No user found for that email.');
                          AwesomeDialog(
                            context: context,
                            dialogType: DialogType.info,
                            animType: AnimType.rightSlide,
                            title: 'Alert',
                            desc: 'No user found for that email.',
                          ).show();
                        } else if (e.code == 'wrong-password') {
                          print('Wrong password provided for that user.');
                          AwesomeDialog(
                            context: context,
                            dialogType: DialogType.info,
                            animType: AnimType.rightSlide,
                            title: 'Alert',
                            desc: 'Wrong password provided for that user.',
                          ).show();
                        }
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
                    child: Text("Login",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          color: Colors.white,
                        ))),
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Text(
              'or sign in with:',
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
                      signInWithGoogle();
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
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "New User? > ",
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
                          builder: (context) => SignupScreen(),
                        ));
                  },
                  child: Text(
                    "SIGN UP",
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
