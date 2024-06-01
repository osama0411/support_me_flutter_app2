import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:grad_project/controller/add_screen.dart';
import 'package:grad_project/controller/arts_screen.dart';
import 'package:grad_project/view/chat_screen.dart';
import 'package:grad_project/view/home_screen2.dart';
import 'package:grad_project/controller/newest_screen.dart';
import 'package:grad_project/controller/popular_screen.dart';
import 'package:grad_project/view/profile_screen.dart';
import 'package:grad_project/view/search_screen.dart';
import 'package:grad_project/model/signin_screen.dart';
import 'package:grad_project/controller/tictak_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final screens = [
    HomeScreen2(), // Replace with your HomeScreen widget class
    ChatingScreen(),
    AddScreen(),
    SearchScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          height: 75,
          backgroundColor: Colors.white,
          color: Color(0xA5495E57),
          animationDuration: Duration(milliseconds: 300),

          items: [
            Icon(
              Icons.home,
              size: 30,
            ),
            Icon(
              Icons.chat,
              size: 30,
            ),
            Icon(
              Icons.add_circle,
              size: 30,
            ),
            Icon(
              Icons.search,
              size: 30,
            ),
            Icon(
              Icons.person,
              size: 30,
            ),
          ],
        ),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
                onPressed: () async {
                  GoogleSignIn googlesignin = GoogleSignIn();
                  googlesignin.disconnect();
                  await FirebaseAuth.instance.signOut();
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => SigninScreen()));
                },
                icon: Icon(Icons.exit_to_app))
          ],
        ),
        body: screens[_selectedIndex],
      ),
    );
  }
}
