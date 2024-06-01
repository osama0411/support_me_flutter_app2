import 'package:flutter/material.dart';

class TictakScreen extends StatefulWidget {
  const TictakScreen({super.key});

  @override
  State<TictakScreen> createState() => _TictakScreenState();
}

class _TictakScreenState extends State<TictakScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child:Text("tictak"),
        color: Colors.blueAccent,

      ),

    );
  }
}
/*
 SingleChildScrollView(
          padding: EdgeInsets.only(top: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Column(
                children: [
                  Text(
                    'Satisfy your curiosity',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFFF4CE14),
                      fontSize: 24,
                      //fontFamily: 'Architects Daughter',
                      fontWeight: FontWeight.w400,
                      height: 0.04,
                      //letterSpacing: -0.32,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'and explore',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFFF4CE14),
                      fontSize: 24,
                      //fontFamily: 'Architects Daughter',
                      fontWeight: FontWeight.w400,
                      height: 0.04,
                      //letterSpacing: -0.32,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TabBar(
                    //dividerColor: Colors.amber,
                    indicatorColor: Colors.amber,
                    tabs: [
                      Tab(
                        child: Text(
                          "Arts",
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        ),
                      ),
                      Tab(
                        child: Text(
                          "Popular",
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        ),
                      ),
                      Tab(
                        child: Text(
                          "Newest",
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        ),
                      ),
                      Tab(
                        child: Text(
                          "Tictak",
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
 */