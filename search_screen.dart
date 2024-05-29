import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  // Replace with your actual data or API call to fetch art details
  final List<String> titles = List.generate(12, (index) => 'Knitting wool bags $index');
  final List<String> subtitles =
      List.generate(12, (index) => 'Perfect hande made arts$index');
  final List<String> imageUrls = List.generate(
      12,
      (index) =>
          'https://picsum.photos/id/${index + 200}/200'); // Random image placeholder

  TextEditingController SearchTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Search',
          style: TextStyle(
            color: Color(0xFFF4CE14),
            fontSize: 30,
            fontWeight: FontWeight.w400,
            height: 0.04,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
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


          SizedBox(
            height: 20,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(10.0),
              child: GridView.count(
                crossAxisCount: 2,
                // Two items per row
                mainAxisSpacing: 10.0,
                // Spacing between rows
                crossAxisSpacing: 10.0,
                // Spacing between items
                childAspectRatio: 1.0,
                // Square aspect ratio for photos
                children: List.generate(
                    titles.length,
                    (index) => ArtGridItem(
                        title: titles[index],
                        subtitle: subtitles[index],
                        imageUrl: imageUrls[index])),
              ),
            ),
          ),
        ],
      ),

      // Padding(
      //   padding: const EdgeInsets.only(left: 25, right: 25),
      //   child: TextField(
      //     controller: SearchTextEditingController,
      //     keyboardType: TextInputType.text,
      //     decoration: InputDecoration(
      //       label: Text(
      //         "Search",
      //         style: TextStyle(
      //           color: Color(0xFF505050),
      //           fontSize: 15,
      //           //fontFamily: 'Poppins',
      //           fontWeight: FontWeight.w600,
      //           //height: 0,
      //         ),
      //       ),
      //       border: OutlineInputBorder(
      //         borderRadius: BorderRadius.circular(8),
      //       ),
      //       prefixIcon: Icon(
      //         Icons.search,
      //         color: Colors.black45,
      //       ),
      //       contentPadding: EdgeInsets.all(3),
      //       hintText: " ",
      //       filled: true,
      //       fillColor: Color(0xBA495E57),
      //     ),
      //   ),
      //
      // ),
    );
  }
}

class ArtGridItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imageUrl;

  ArtGridItem(
      {required this.title, required this.subtitle, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: <Widget>[
          // Transparent black overlay on top of the image
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.black.withOpacity(0.3),
            ),
          ),
          // Text positioned at the bottom with white color and some padding
          Positioned(
            bottom: 20.0,
            left: 20.0,
            child: Text(
              title,
              style: TextStyle(color: Colors.white, fontSize: 16.0),
            ),
          ),
          SizedBox(height: 10),
          // Subtitle positioned below the title with slightly smaller font size
          Positioned(
            bottom: 5.0,
            left: 10.0,
            child: Text(
              subtitle,
              style: TextStyle(color: Colors.white, fontSize: 14.0),
            ),
          ),
        ],
      ),
    );
  }
}
