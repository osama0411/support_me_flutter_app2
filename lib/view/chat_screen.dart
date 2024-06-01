import 'package:flutter/material.dart';

class ChatingScreen extends StatefulWidget {
  const ChatingScreen({super.key});

  @override
  State<ChatingScreen> createState() => _ChatingScreenState();
}

class _ChatingScreenState extends State<ChatingScreen> {

  TextEditingController SearchTextEditingController = TextEditingController();

  final List<String> userNames = ['Osama', 'Islam', 'Momen', 'Mahmood', 'Khaldon'];



  final _messages = []; // List to store chat messages

  final _messageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(),
      //backgroundColor:Colors.amber,
      appBar: AppBar(
        title: Center(
          child: Text(
            'Chats',
            style: TextStyle(
              color: Color(0xFFF4CE14),
              fontSize: 30,
              fontWeight: FontWeight.w400,
              height: 0.04,
            ),
          ),
        ),
        backgroundColor: Colors.white,
      ),




      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [


            SizedBox(
              height: 5,
            ),


            Padding(
              padding: const EdgeInsets.only(right:  250),
              child: Text(
                  'Messages',
                  //textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: TextField(
                controller: SearchTextEditingController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  label: Text(
                    "Search",
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
                    Icons.search,
                    color: Colors.black45,
                  ),
                  contentPadding: EdgeInsets.all(3),
                  hintText: " ",
                  filled: true,
                  fillColor: Color(0xBA495E57),
                ),
              ),

            ),
            SizedBox(height: 20.0),


            Expanded(
              child: ListView.builder(
                //separatorBuilder: (context, index) => Divider(),
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(
                          'https://picsum.photos/id/${index + 100}/50',
                          // Random image placeholder
                        ),
                      ),
                      title: Text(
                        userNames[index], // Use name from userNames list
                        style: TextStyle(fontSize: 25.0),
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

Column(
        children: [
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
        ],
      ),


 */
