import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:grad_project/funding_screen.dart';
import 'package:grad_project/payment_screen.dart';
import 'package:grad_project/reward_screen.dart';
import 'package:grad_project/story_screen.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class BasicScreen extends StatefulWidget {
  const BasicScreen({super.key});

  @override
  State<BasicScreen> createState() => _BasicScreenState();
}

class _BasicScreenState extends State<BasicScreen> {
  TextEditingController TitleTextEditingController = TextEditingController();
  TextEditingController SubTitleTextEditingController = TextEditingController();
  TextEditingController CampainTextEditingController = TextEditingController();

  File? SelectedImage;
  String? url;

  getImage({required ImageSource imageSource}) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: imageSource);
    if (image != null) {
      SelectedImage = File(image.path);
      var imagename = basename(image.path);
      var refStorge = FirebaseStorage.instance.ref("imagename");
      await refStorge.putFile(SelectedImage!);
      url = await refStorge.getDownloadURL();

      setState(() {});
    }
  }

  CollectionReference campains =
      FirebaseFirestore.instance.collection('campains');

  // Future<void>
  addCampains() async {
    //return campains
    try {
      DocumentReference respose = await campains.add({
        'title': TitleTextEditingController.text,
        'sub_title': SubTitleTextEditingController.text,
        'url': url ??"none",
        'campaignduration': CampainTextEditingController.text,

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
                    width: 20,
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FundingScreen(),
                          ));
                    },
                    icon: Image.asset(
                      "assets/images/funding.png",
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RewardScreen(),
                          ));
                    },
                    icon: Image.asset("assets/images/reward.png"),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => StoryScreen(),
                          ));
                    },
                    icon: Image.asset("assets/images/story.png"),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PaymentScreen(),
                          ));
                    },
                    icon: Image.asset("assets/images/payment.png"),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Start with the basics make it easy for people to learn about your project :',
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
                'Project Title',
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
                'Title',
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
                  controller: TitleTextEditingController,
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
                height: 10,
              ),
              Text(
                'Sub Title',
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
                  controller: SubTitleTextEditingController,
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
                height: 10,
              ),
              Text(
                'Project image',
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
              Stack(
                alignment: Alignment.center,
                children: [
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xBA495E57),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      height: 150,
                      width: 300,
                    ),
                  ),
                  url == null
                      ? Image.asset(
                          "assets/images/imageicon.png",
                          height: 100,
                          width: 100,
                          fit: BoxFit.fill,
                        )
                      : Image.network(
                          url!,
                          height: 150,
                          width: 300,
                          fit: BoxFit.fill,
                        ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Color(0xFFF4CE14),
                    // Button background color
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(10), // Button border radius
                    ),
                  ),
                  onPressed: () {

                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          icon: Icon(Icons.photo),
                          title: Text("Select image"),
                          actions: [
                            Padding(
                              padding: const EdgeInsets.only(left: 65),
                              child: Row(
                                children: [
                                  IconButton(
                                    onPressed: () async {
                                      await getImage(
                                          imageSource: ImageSource.camera);
                                      Navigator.pop(context);
                                    },
                                    icon: Icon(Icons.camera_alt),
                                  ),
                                  IconButton(
                                    onPressed: () async {
                                      await getImage(
                                          imageSource: ImageSource.gallery);
                                      Navigator.pop(context);
                                    },
                                    icon: Icon(Icons.photo_library),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Text(
                    "Add image",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                ),


              ),
              // if(url != null)
              //   Image.network(
              //     url!,
              //     height: 150,
              //     width: 300,
              //     fit: BoxFit.fill,
              //
              //   ),

              SizedBox(
                height: 30,
              ),
              Text(
                'Campian duration',
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
                  maxLength: 2,
                  controller: CampainTextEditingController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    hintText: "in monthes (max:12)",
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
                            builder: (context) => FundingScreen(),
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
                    child: Text(
                      "Next",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
