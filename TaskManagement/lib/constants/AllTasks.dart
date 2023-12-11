import 'dart:convert';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:taskmanagement/Dashboard.dart';
import 'package:taskmanagement/constants/AppConstants.dart';
import 'package:taskmanagement/constants/BackgroundImage.dart';
import 'package:taskmanagement/constants/BuildCalenderTextField.dart';
import 'package:taskmanagement/constants/BuildDescriptionTextBox.dart';
import 'package:taskmanagement/constants/BuildDropdown.dart';
import 'package:taskmanagement/constants/BuildLabelText.dart';
import 'package:taskmanagement/constants/BuildTextFormField.dart';

class AllTasks extends StatefulWidget {
  const AllTasks({super.key});

  @override
  State<AllTasks> createState() => _AllTasksState();
}

class _AllTasksState extends State<AllTasks>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  late List<TaskList> tasks;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    tasks = []; // Initialize with an empty list or parsed data

    // Example: Load JSON data from a file, asset, or API call
    loadTasksFromJson();
  }

  void loadTasksFromJson() {
    // Load your JSON data here
    String jsonString = '''
[
  {
    "taskId": 1,
    "assignee": "Edward",
    "designation": "CEO",
    "priority": "High",
    "dueDate": "2023-09-24",
    "status": "Open"
  },
  {
    "taskId": 2,
    "assignee": "Emily",
    "designation": "Manager",
    "priority": "Medium",
    "dueDate": "2023-10-10",
    "status": "Open"
  },
  {
    "taskId": 3,
    "assignee": "Michael",
    "designation": "Developer",
    "priority": "Low",
    "dueDate": "2023-11-15",
    "status": "Open"
  },
  {
    "taskId": 4,
    "assignee": "Sarah",
    "designation": "Designer",
    "priority": "High",
    "dueDate": "2023-12-01",
    "status": "Open"
  },
  {
    "taskId": 5,
    "assignee": "John",
    "designation": "Sales",
    "priority": "Medium",
    "dueDate": "2023-08-20",
    "status": "Open"
  },
  {
    "taskId": 6,
    "assignee": "Anna",
    "designation": "HR",
    "priority": "High",
    "dueDate": "2023-07-22",
    "status": "Pending"
  },
  {
    "taskId": 7,
    "assignee": "David",
    "designation": "Marketing",
    "priority": "Low",
    "dueDate": "2023-09-30",
    "status": "Pending"
  },
  {
    "taskId": 8,
    "assignee": "Sophia",
    "designation": "Product Manager",
    "priority": "Medium",
    "dueDate": "2023-10-05",
    "status": "Pending"
  },
  {
    "taskId": 9,
    "assignee": "Daniel",
    "designation": "CTO",
    "priority": "High",
    "dueDate": "2023-11-10",
    "status": "Pending"
  },
  {
    "taskId": 10,
    "assignee": "Grace",
    "designation": "Intern",
    "priority": "Low",
    "dueDate": "2023-12-05",
    "status": "Pending"
  },
  {
    "taskId": 11,
    "assignee": "Oliver",
    "designation": "Support",
    "priority": "Medium",
    "dueDate": "2023-07-15",
    "status": "Closed"
  },
  {
    "taskId": 12,
    "assignee": "Isabella",
    "designation": "Accountant",
    "priority": "High",
    "dueDate": "2023-08-25",
    "status": "Closed"
  },
  {
    "taskId": 13,
    "assignee": "Ethan",
    "designation": "Operations",
    "priority": "Low",
    "dueDate": "2023-09-05",
    "status": "Closed"
  },
  {
    "taskId": 14,
    "assignee": "Mia",
    "designation": "Finance",
    "priority": "Medium",
    "dueDate": "2023-10-20",
    "status": "Closed"
  },
  {
    "taskId": 15,
    "assignee": "Lucas",
    "designation": "Legal",
    "priority": "High",
    "dueDate": "2023-11-30",
    "status": "Closed"
  }
]
''';


    tasks = parseTasks(jsonString);
    setState(() {}); // Call setState to rebuild the widget with the loaded tasks
  }

  @override
  void dispose() {
    _tabController?.dispose(); // Use the safe call operator to avoid errors
    super.dispose();
  }

  Widget _buildTaskList(List<TaskList> tasks) {
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        final task = tasks[index];
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))
          ),
          elevation: 4.0, // Adjust elevation for shadow
          margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0), // Spacing around the card
          child: ListTile(
            title: Text(task.assignee),
            subtitle: Text(task.designation),
            trailing: Text(task.priority),
            // You can add onTap or other event handlers here
          ),
        );
      },
    );
  }

  List<TaskList> parseTasks(String jsonResponse) {
    final data = jsonDecode(jsonResponse) as List;
    return data.map((json) => TaskList.fromJson(json)).toList();
  }
  List<TaskList> filterTasksByStatus(List<TaskList> tasks, String status) {
    return tasks.where((task) => task.status == status).toList();
  }

  @override
  Widget build(BuildContext context) {
    // Check if _tabController is initialized before using it
    if (_tabController == null) {
      return Container(); // Or some other placeholder widget
    }

    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: BackgroundStack(
        child: SafeArea(
          child: Column(
            children: [
              AppBar(
                title: const Text("Task List"),
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
              Expanded(
                child: Card(
                  margin: EdgeInsets.zero,
                  color: AppConstants.cardbackground,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),
                  ),
                  child: Column(
                    children: [
                      Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Container(
                            height: 3.0, // Height of the black line
                            color: Colors.black, // Color of the black line
                          ),
                          TabBar(
                            controller: _tabController,
                            indicator: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors.green,
                                  // Color for the active tab indicator
                                  width:
                                      3.0, // Thickness of the active tab indicator
                                ),
                              ),
                            ),
                            tabs: const [
                              Tab(
                                child: Text(
                                  "Open",
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                              Tab(
                                child: Text(
                                  "Pending",
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                              Tab(
                                child: Text(
                                  "Closed",
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      Expanded(
                        child: TabBarView(
                          controller: _tabController,
                          children: [
                            _buildTaskList(filterTasksByStatus(tasks, 'Open')),
                            _buildTaskList(filterTasksByStatus(tasks, 'Pending')),
                            _buildTaskList(filterTasksByStatus(tasks, 'Closed')),
                          ],
                        ),
                      ),
                    ],
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

// Tab(
// child: Text(
// "Open",
// style: TextStyle(color: Colors.black),
// ),
// ),
// Tab(
// child: Text(
// "Pending",
// style: TextStyle(color: Colors.black),
// ),
// ),
// Tab(
// child: Text(
// "Closed",
// style: TextStyle(color: Colors.black),
// ),
// ),
//
// Card(
// color: AppConstants.cardbackground,
// shape: RoundedRectangleBorder(
// borderRadius: BorderRadius.only(
// topLeft: Radius.circular(20.0),
// topRight: Radius.circular(20.0),
// ),
// ),
// child: Column(
// children: [
// // TabBar inside Material
// Material(
// color: AppConstants.cardbackground,
// // Ensure this matches the Card's color
// child: Container(
// decoration: BoxDecoration(
// borderRadius: BorderRadius.only(
// topLeft: Radius.circular(20.0),
// topRight: Radius.circular(20.0),
// ),
// ),
// child: Stack(
// alignment: Alignment.bottomCenter,
// children: [
// Container(
// height: 2.0, // Height of the black line
// color: Colors.black, // Color of the black line
// ),
// TabBar(
//
//
// controller: _tabController,
// indicator: BoxDecoration(
// border: Border(
// bottom: BorderSide(
// color: Colors.green, // Color for the active tab indicator
// width: 3.0, // Thickness of the active tab indicator
// ),
// ),
// ),
// //
// // indicatorColor: Colors.green,
// // // Color for the active tab indicator
// // indicatorSize: TabBarIndicatorSize.tab,
// // // Makes the indicator fit to each tab
// // physics: AlwaysScrollableScrollPhysics(),
// tabs: const [
// Tab(
// child: Text(
// "Open",
// style: TextStyle(color: Colors.black),
// ),
// ),
// Tab(
// child: Text(
// "Pending",
// style: TextStyle(color: Colors.black),
// ),
// ),
// Tab(
// child: Text(
// "Closed",
// style: TextStyle(color: Colors.black),
// ),
// ),
// ],
// ),
// ],
// ),
// ),
// ),
// Expanded(
// // TabBarView
// child: TabBarView(
// controller: _tabController,
// children: const [
// // Replace with your actual content
// Center(child: Text("Content of Tab 1")),
// Center(child: Text("Content of Tab 2")),
// Center(child: Text("Content of Tab 3")),
// ],
// ),
// ),
// ],
// ),
// ),


class TaskList {
  final int taskId;
  final String assignee;
  final String designation;
  final String priority;
  final DateTime dueDate;
  final String status;

  TaskList({
    required this.taskId,
    required this.assignee,
    required this.designation,
    required this.priority,
    required this.dueDate,
    required this.status,
  });

  factory TaskList.fromJson(Map<String, dynamic> json) {
    return TaskList(
      taskId: json['taskId'],
      assignee: json['assignee'],
      designation: json['designation'],
      priority: json['priority'],
      dueDate: DateTime.parse(json['dueDate']),
      status: json['status'],
    );
  }
}
