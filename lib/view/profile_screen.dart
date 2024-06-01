import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // Sample user data (replace with actual data fetching or user object)
  final String name = 'Osama';
  final String imageUrl =
      'https://picsum.photos/id/200/200'; // Placeholder image

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        centerTitle: true,
        title: Text(
          'Profile',
          style: TextStyle(
            color:  Colors.amber,
            fontSize:25 ,
            fontWeight: FontWeight.bold,
          ),

        ),
        actions: <Widget>[
          // Add actions to app bar
          IconButton(
            icon: Icon(Icons.edit), // Edit icon
            onPressed: () {
              // Handle edit button press (navigate to edit screen, etc.)
              print('Edit button pressed');
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // Center content vertically
          children: <Widget>[
            // Profile picture with rounded corners
            CircleAvatar(
              radius: 80.0, // Adjust image size as needed
              backgroundImage: NetworkImage(imageUrl),
            ),
            SizedBox(height: 20.0),
            // Add spacing

            // User name with slightly bigger font
            Text(
              name,
              style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
            ),

            // Additional information sections (replace with your desired details)
            Row(
              mainAxisAlignment: MainAxisAlignment.center, // Center row content
              children: <Widget>[
                Icon(Icons.email),
                SizedBox(width: 10.0),
                Text('osamanasser323@gmail.com'),
              ],
            ),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.phone),
                SizedBox(width: 10.0),
                Text('0790654523'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
