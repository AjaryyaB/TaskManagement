import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taskmanagement/constants/BackgroundImage.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      key: _scaffoldKey,
      body: Stack(
        children: [
          BackgroundStack(
            child: Center(
              child: Text(
                'Your Dashboard Content Goes Here',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AppBar(
              title: Row(
                children: [
                  // IconButton(
                  //   icon: Icon(Icons.menu),
                  //   onPressed: () {
                  //     _scaffoldKey.currentState?.openDrawer();
                  //   },
                  // ),
                  SizedBox(width: 16), // Add some space between the menu icon and the circular avatar
                  CircleAvatar(
                    radius: 20, // Adjust the radius as needed
                    backgroundImage: AssetImage('assets/your_photo.jpg'), // Replace with your actual photo
                  ),
                  SizedBox(width: 16), // Add some space between the circular avatar and the title
                  Text('Dashboard'),
                ],
              ),
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
          ),
        ],
      ),
      drawer: Drawer(
        // Your side menu content goes here
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Side Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text('Item 1'),
              onTap: () {
                // Handle item 1 tap
              },
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {
                // Handle item 2 tap
              },
            ),
          ],
        ),
      ),
    );
  }
}
