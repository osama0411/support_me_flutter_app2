import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grad_project/model/overview_screen.dart';

class HomeScreen2 extends StatefulWidget {
  const HomeScreen2({super.key});

  @override
  State<HomeScreen2> createState() => _HomeScreen2State();
}

class _HomeScreen2State extends State<HomeScreen2> {
  List<QueryDocumentSnapshot> data = [];

  getData() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection("campains").get();
    data.addAll(querySnapshot.docs);
    setState(() {});
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  // List<String> ImagesAssetsPathes = [
  //   "assets/images/ph1.png",
  //   "assets/images/ph2.png",
  //   "assets/images/ph3.png",
  //   "assets/images/ph4.png",
  //   "assets/images/ph1.png",
  //   "assets/images/ph2.png",
  // ];
  // List<String> TextEachGrid = [
  //   "Luxurious oil paintings :",
  //   "Get a bag that is different from the rest :",
  //   "Genuine leather wallets :",
  //   "Fabric patches of wool :",
  //   "Luxurious oil paintings :",
  //   "Get a bag that is different from the rest :",
  // ];
  // List<String> TextEachGrid2 = [
  //   "High quality oil painting",
  //   "Weaving bags with original wool and high quality",
  //   "Fine stitching with luxurious leather",
  //   "High quality imported wool",
  //   "High quality oil painting",
  //   "Weaving bags with original wool and high quality",
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.blue,

      body: Container(
        height: 720,
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Text(
              'Satisfy your curiosity',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFFF4CE14),
                fontSize: 24,
                fontWeight: FontWeight.w400,
                height: 0.04,
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
                fontWeight: FontWeight.w400,
                height: 0.04,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            DefaultTabController(
              length: 4,
              child: TabBar(
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
            ),
            SizedBox(
              height: 15,
            ),
            Expanded(
              child: GridView.builder(
                itemCount: data.length,
                padding: EdgeInsets.all(5),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                ),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OverviewScreen(),
                          ));
                    },
                    child: Card(
                      child: Container(
                        height: 20,
                        child: Column(
                          children: [
                            if(data[index]['url'] != "none")
                            Image.network(
                              data[index]['url'],
                              height: 250,
                              fit: BoxFit.fill,
                              width: 1000,
                            ),
                            SizedBox(height: 20,),
                            Text(
                              "${data[index]['title']}",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10,),
                            Text(
                              "${data[index]['sub_title']}",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),

                        // decoration: BoxDecoration(
                        //   borderRadius: BorderRadius.circular(0),
                        //   color: Colors.transparent,
                        // ),
                        // //color: Colors.blue, // Placeholder color
                        // child: Container(
                        //   //padding: EdgeInsets.all(),
                        //   // height: 100,
                        //   decoration: BoxDecoration(
                        //     borderRadius: BorderRadius.circular(0),
                        //     //color:Colors.blue,
                        //   ),
                        //   child: Stack(
                        //     fit: StackFit.expand,
                        //     children: [
                        //       ClipRRect(
                        //         borderRadius: BorderRadius.circular(20),
                        //         child: Image.asset(
                        //           ImagesAssetsPathes[index],
                        //           height: 100,
                        //           alignment: Alignment.topCenter,
                        //         ),
                        //       ),
                        //       Positioned(
                        //         bottom: 0,
                        //         left: 0,
                        //         right: 0,
                        //         child: Container(
                        //           height: 180,
                        //           decoration: BoxDecoration(
                        //             borderRadius: BorderRadius.only(
                        //                 topRight: Radius.circular(0),
                        //                 topLeft: Radius.circular(0)),
                        //             color: Colors.white10.withOpacity(0.5),
                        //           ),
                        //           //color: Colors.blue.withOpacity(0.5), // Semi-transparent blue background
                        //           padding: EdgeInsets.symmetric(
                        //               vertical: 1, horizontal: 3),
                        //           child: Column(
                        //
                        //             children: [
                        //               Text(
                        //                 "${data[index]['title']}",
                        //                 // Replace this with your text
                        //                 style: TextStyle(
                        //                   color: Colors.black,
                        //                   fontSize: 20,
                        //                   fontWeight: FontWeight.bold,
                        //                 ),
                        //               ),
                        //               Text(
                        //                 "${data[index]['sub_title']}",
                        //                 // Replace this with your text
                        //                 style: TextStyle(
                        //                   color: Colors.black,
                        //                   fontSize: 14,
                        //                   fontWeight: FontWeight.bold,
                        //                 ),
                        //               ),
                        //             ],
                        //           ),
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
/*
GridView.builder(
            gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
            itemBuilder: (context, index) => GridTile(
              footer: GridTileBar(
                backgroundColor: Colors.white,
                title: Text("one"),
              ),
              child: Image.asset("assets/images/gr1.png"),
            ),
            itemCount: 20,
          ),
 */
