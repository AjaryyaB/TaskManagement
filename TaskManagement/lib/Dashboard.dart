import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taskmanagement/CreateTask.dart';
import 'package:taskmanagement/EntityCards.dart';
import 'package:taskmanagement/constants/AppConstants.dart';
import 'package:taskmanagement/constants/BackgroundImage.dart';
List<Company> companies = [
  Company(
    name: 'Company A',
    tasks: [
      Task(status: 'open'),
      Task(status: 'open'),
      Task(status: 'inprogress'),
      Task(status: 'overdue'),
    ],
  ),
  Company(
    name: 'Company B',
    tasks: [
      Task(status: 'open'),
      Task(status: 'inprogress'),
      Task(status: 'inprogress'),
    ],
  ),
  Company(
    name: 'Company C',
    tasks: [
      Task(status: 'open'),
      Task(status: 'inprogress'),
      Task(status: 'inprogress'),
    ],
  ),
  Company(
    name: 'Company D',
    tasks: [
      Task(status: 'open'),
      Task(status: 'inprogress'),
      Task(status: 'inprogress'),
    ],
  ),
  // Add more companies as needed
];

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
            child: Column(
              children: [
                SizedBox(
                    height:120),
                Padding(
                  padding: const EdgeInsets.only(top:36.0),
                  child: Container(
                   // width: screenWidth*1.5,
                    height: screenHeight *0.77,
                    decoration: BoxDecoration(
                      color: AppConstants.cardbackground,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0),),

                    ),
                     // child:
                       //  MyApp(companies: companies),

                      ),
                  ),

              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AppBar(
              toolbarHeight: screenHeight*0.10,
              title: Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    // backgroundImage: AssetImage('assets/your_photo.jpg'),
                  ),
                  SizedBox(width: 16),
                  Column(
                    children: [
                      Text('Dashboard'),
                      Text('Project Manager',style: TextStyle(
                        fontSize: 16,
                      ),),
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CreateTask()),
          );
        },
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomAppBar(
       // height: screenHeight*0.10,
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
                // Handle home button tap
              },
            ),
            SizedBox(width: 20,),
            IconButton(
              icon: Icon(Icons.calendar_month),
              onPressed: () {
                // Handle home button tap
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
}
