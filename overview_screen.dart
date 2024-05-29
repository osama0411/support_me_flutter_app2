import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OverviewScreen extends StatefulWidget {
  const OverviewScreen({super.key});

  @override
  State<OverviewScreen> createState() => _OverviewScreenState();
}

class _OverviewScreenState extends State<OverviewScreen> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Text("PROJECT OVERVIEW"),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(
              itemCount: data.length,
              padding: EdgeInsets.all(5),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
              ),
              itemBuilder: (context, index) {
                return Container(
                  height: 50,
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
                      SizedBox(height: 10,),
                      Text(
                        "${data[index]['campaignduration']}",
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
