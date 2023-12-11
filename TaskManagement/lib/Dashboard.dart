import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taskmanagement/CreateTask.dart';
import 'package:taskmanagement/EntityCards.dart';
import 'package:taskmanagement/constants/AppConstants.dart';
import 'package:taskmanagement/constants/BackgroundImage.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int selectedIndex = 0; // Added field to track selected item index

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      key: _scaffoldKey,
      body: BackgroundStack(
        child: Column(
          children: [
            SizedBox(height: screenHeight * 0.02),
            AppBar(
              title: Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage('assets/images/profile@2x.png'),
                  ),
                  SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Amelia Wirtz'),
                      Text(
                        'Project Manager',
                        style: TextStyle(
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.notifications),
                    onPressed: () {},
                  ),
                ],
              ),
              backgroundColor: Colors.transparent,
              elevation: 0,
              toolbarHeight: screenHeight * 0.10,
            ),
            SizedBox(height: 30,),
            Expanded(
              child: Container(
                height: screenHeight * 0.77,
                width: screenWidth,
                decoration: BoxDecoration(
                  color: AppConstants.cardbackground,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                ),
                child: Navigator(
                  onGenerateRoute: (routeSettings) {
                    return MaterialPageRoute(
                      builder: (context) => MyApp(),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: AppConstants.boldBlue,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/images/profile@2x.png'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:40.0),
                    child: Column(
                      children: [
                        Text(
                          'Amelia Wirtz',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                          ),
                        ),
                        Text(
                          'Project Director',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            buildDrawerItem(0, 'Dashboard', AssetImage('assets/images/Iconly-Light-Outline-Category.png')),
            buildDrawerItem(1, 'Inbox', AssetImage('assets/images/Iconly-Light-Outline-Message.png')),
            buildDrawerItem(2, 'Tasks',AssetImage('assets/images/Iconly-Light-Tick-Square.png')),
            buildDrawerItem(3, 'Groups',AssetImage('assets/images/2-User.png')),
            buildDrawerItem(4, 'Calendar',AssetImage('assets/images/Iconly-Light-Outline-Calender.png')),
            buildDrawerItem(5, 'Users',AssetImage('assets/images/2-User.png')),
            buildDrawerItem(6, 'Masters',AssetImage('assets/images/2-User.png')),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CreateTask()),
          );
        },
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                // Handle home button tap
              },
            ),
            IconButton(
              icon: Icon(Icons.bar_chart),
              onPressed: () {
                // Handle statistics button tap
              },
            ),
            SizedBox(width: 20),
            IconButton(
              icon: Icon(Icons.calendar_month),
              onPressed: () {
                // Handle calendar button tap
              },
            ),
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                // Handle settings button tap
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDrawerItem(int index, String title, ImageProvider<Object> imageProvider) {
    return Container(
      margin: EdgeInsets.only(right: 20.0), // Adjust margin as needed
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            setState(() {
              selectedIndex = index;
            });

            // You can add additional logic here based on the selected index
            switch (index) {
              case 0:
              // Handle Dashboard selection
                break;
              case 1:
              // Handle Inbox selection
                break;
              case 2:
              // Handle Inbox selection
                break;
              case 3:
              // Handle Inbox selection
                break;
            // Add cases for other items if needed
            }
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(index == selectedIndex ? 20.0 : 0.0),
                bottomRight: Radius.circular(index == selectedIndex ? 20.0 : 0.0),
              ),
              color: index == selectedIndex
                  ? AppConstants.boldBlue // Highlighted color
                  : Colors.transparent,   // Default color
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Image(
                    image: imageProvider,
                    width: 24.0, // Adjust the width as needed
                    height: 24.0, // Adjust the height as needed
                  ),
                  SizedBox(width: 16.0),
                  Text(
                    title,
                    style: TextStyle(
                      color: index == selectedIndex
                          ? Colors.white // Highlighted text color
                          : Colors.black, // Default text color
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
