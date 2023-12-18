import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taskmanagement/CreateTask.dart';
import 'package:taskmanagement/EntityCards.dart';
import 'package:taskmanagement/Entity.dart';
import 'package:taskmanagement/Groups.dart';
import 'package:taskmanagement/Login.dart';
import 'package:taskmanagement/Users.dart';
import 'package:taskmanagement/constants/AllTasks.dart';
import 'package:taskmanagement/constants/AppConstants.dart';
import 'package:taskmanagement/constants/BackgroundImage.dart';
import 'package:taskmanagement/test.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:taskmanagement/TaskDetails.dart';
import 'dart:convert';

import 'package:taskmanagement/constants/AppConstants.dart';
import 'package:taskmanagement/constants/Toast.dart';

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
                child:MyApp()
              ),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: Column(

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
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                //SizedBox(height:screenHeight*0.02),
                buildDrawerItem(0, 'Dashboard', AssetImage('assets/images/Iconly-Light-Outline-Category.png')),
              //  SizedBox(height:screenHeight*0.02),
                buildDrawerItem(2, 'Tasks',AssetImage('assets/images/Iconly-Light-Outline-Tick-Square.png')),
               // SizedBox(height:screenHeight*0.02),
                buildDrawerItem(3, 'Entities',AssetImage('assets/images/2-User.png')),
              //  SizedBox(height:screenHeight*0.02),
                buildDrawerItem(4, 'Calendar',AssetImage('assets/images/Iconly-Light-Outline-Calendar.png')),
               // SizedBox(height:screenHeight*0.02),
                buildDrawerItem(5, 'Users',AssetImage('assets/images/2-User.png')),
               // SizedBox(height:screenHeight*0.02),
                buildDrawerItem(6, 'Groups',AssetImage('assets/images/2-User.png')),
                //SizedBox(height:screenHeight*0.02),
                buildDrawerItem(7, 'Reports',AssetImage('assets/images/2-User.png')),
               // SizedBox(height:screenHeight*0.12),
                buildDrawerItem(8, 'Logout',AssetImage('assets/images/2-User.png')),
              ],
            )

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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AllTasks()),
                );
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

                break;
              case 1:


                break;
              case 2:

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AllTasks()),
                );
                break;
              case 3:
                //calender

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AllEntity()),
              );
                break;
              case 4:

                break;
              case 5:
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Users()),
                );

                break;
              case 6:
              //Groups
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Groups()),
                );
                break;
              case 7:


                break;
              case 8:
              //logout
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                );
               // Login();
                break;
            // Add cases for other items if needed Login
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
                  ? AppConstants.pinputColor // Highlighted color
                  : Colors.transparent,   // Default color
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(width: 16.0),
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
                          ? AppConstants.boldBlue // Highlighted text color
                          : AppConstants.boldBlue, // Default text color
                      fontWeight: FontWeight.bold,
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
class Entity {
  int entityId;
  String entityName;
  int open;
  int inProgress;
  int overdue;

  Entity({
    required this.entityId,
    required this.entityName,
    required this.open,
    required this.inProgress,
    required this.overdue,
  });
}

class Task {
  int taskId;
  String assignee;
  String designation;
  String priority;
  DateTime dueDate;

  Task({
    required this.taskId,
    required this.assignee,
    required this.designation,
    required this.priority,
    required this.dueDate,
  });

  String get formattedDueDate {
    return DateFormat('yyyy-MM-dd').format(dueDate);
  }
}

class EntityCard extends StatelessWidget {
  final Entity entity;
  final VoidCallback onTap;
  final bool isSelected;

  EntityCard(
      {required this.entity, required this.onTap, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        margin: EdgeInsets.all(10),
        child: Container(
          width: 240,
          height: 120,
          decoration: BoxDecoration(
              border: Border.all(
                color: isSelected ? AppConstants.boldBlue : Colors.transparent,
                width: 5.0,
              ),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: ListTile(
            subtitle: Column(
              children: [
                Row(
                  children: [
                    Image.asset(
                      "assets/images/Group4624@2x.png",
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      entity.entityName,
                      style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                    ),
                  ],
                ),
                SizedBox(
                  height: 22,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Text('Open'),
                        Text(
                          '${entity.open}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 23,
                              color: Colors.green),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 13,
                    ),
                    Column(
                      children: [
                        Text('InProgress'),
                        Text(
                          '${entity.inProgress}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 23,
                              color: Colors.deepOrange),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 13,
                    ),
                    Column(
                      children: [
                        Text('Overdue'),
                        Text('${entity.overdue}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 23,
                                color: Colors.red))
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Entity> entities = [];
  List<Task> tasks = [];
  Entity? selectedEntity;

  get onTap => null;


  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final response = await http.get(Uri.parse(
          'http://192.168.5.214:8080/taskManagement/getAllEntityDetails'));

      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);
        List<Entity> entityList = data
            .map((item) => Entity(
          entityId: item['entityId'],
          entityName: item['entityName'],
          open: item['open'],
          inProgress: item['inprogress'],
          overdue: item['overdue'],
        ))
            .toList();
        // Toastify.successToast(context, "Login Success from entity cards");

        setState(() {
          entities = entityList;
        });
        Toastify.successToast(context, "Login Success");
      } else {
        throw Exception(
            'Failed to load data. Status Code: ${response.statusCode}, Error: ${response.body}');
      }
    } catch (error) {
      print("Error: $error");
    }
  }

  Future<void> fetchTasks(int entityId) async {
    try {
      final response = await http.get(Uri.parse(
          'http://192.168.5.214:8080/taskManagement/getTaskByEntityId/$entityId'));

      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);
        List<Task> taskList = data
            .map((item) => Task(
          taskId: item['taskId'],
          assignee: item['assigne'],
          designation: item['designation'],
          priority: item['priority'],
          dueDate: DateTime.parse(item['dueDate']),
          //dueDate: item['dueDate'],
        ))
            .toList();

        setState(() {
          tasks = taskList;
        });
      } else {
        throw Exception(
            'Failed to load task data. Status Code: ${response.statusCode}, Error: ${response.body}');
      }
    } catch (error) {
      print("Error: $error");
    }
  }

  void onCardTap(Entity selected) {
    setState(() {
      selectedEntity = selected;
    });
    fetchTasks(selected.entityId);
  }

  @override
  Widget build(BuildContext context) {

    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: screenHeight * 0.015),
          entities.isEmpty
              ? Center(child: CircularProgressIndicator())
              : Container(
            height: 150,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: entities.length,
              itemBuilder: (context, index) => EntityCard(
                entity: entities[index],
                onTap: () {
                  onCardTap(entities[index]);
                },
                isSelected: entities[index] == selectedEntity,
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.015),
          selectedEntity != null
              ? Padding(
            padding: const EdgeInsets.only(left: 18.0),
            child: Text(
              "${selectedEntity!.entityName}",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          )
              : Container(),
          SizedBox(height: screenHeight * 0.01),
          tasks.isEmpty
              ? Center(child: Text('No tasks for selected entity'))
              : Expanded(
            child: ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: onTap,
                  child: Container(
                    height: screenHeight * 0.13,
                    child: Card(margin: EdgeInsets.all(10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                      child: ListTile(
                        // title: Text('Task ID: ${tasks[index].taskId}'),
                        subtitle: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                    "assets/images/taskprofile@2x.png"),

                                Padding(
                                  padding: const EdgeInsets.only(top:14.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          //SizedBox(height: 11,),
                                          Text(
                                            '${tasks[index].assignee}',
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: AppConstants.boldBlue,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            '${tasks[index].designation}',
                                            style: TextStyle(
                                              fontSize: 10,
                                              color:
                                              //  AppConstants.designationcolor,
                                              Colors.lightBlue,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        '${tasks[index].formattedDueDate}',
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: AppConstants.boldBlue,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top:12.0),
                              child: Column(
                                children: [
                                  // Conditionally display icons based on priority

                                  Expanded(
                                    child: Row(
                                      children: [
                                        if (tasks[index].priority == 'Low')
                                          Image.asset(
                                              "assets/images/greenflag@2x.png")
                                        else if (tasks[index].priority ==
                                            'Medium')
                                          Image.asset(
                                              "assets/images/orangeflag@2x.png")
                                        else
                                          Image.asset(
                                              "assets/images/redflag@2x.png")
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      '${tasks[index].priority}',
                                      style: TextStyle(fontSize: 10),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            // Add your other task information here
                          ],
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TaskDetails()),
                          );
                        },
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }



}
