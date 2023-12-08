import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:taskmanagement/constants/AppConstants.dart';
import 'package:taskmanagement/constants/Toast.dart';

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
                  height: 10,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Text('Open'),
                        Text('${entity.open}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 23,
                                color: Colors.green))
                      ],
                    ),
                    SizedBox(
                      width: 18,
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
                      width: 18,
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
        Toastify.successToast(context, "Login Success from entity cards");


        setState(() {
          entities = entityList;
        });
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
                      return Container(
                        height: screenHeight * 0.13,
                        child: Card(
                          margin: EdgeInsets.all(10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ),
                          child: ListTile(
                            // title: Text('Task ID: ${tasks[index].taskId}'),
                            subtitle: Expanded(
                            child:Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset("assets/images/taskprofile@2x.png"),

                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          '${tasks[index].assignee}',
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: AppConstants.boldBlue,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          '${tasks[index].designation}',
                                          style: TextStyle(
                                            fontSize: 9,
                                            color:
                                                AppConstants.designationcolor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      '${tasks[index].dueDate.toString()}',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: AppConstants.boldBlue,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    // Conditionally display icons based on priority

                                    Expanded(
                                      child: Row(
                                        children: [
                                          if (tasks[index].priority == 'Low')
                                            Image.asset(
                                                "assets/images/greenflag.png")
                                          else if (tasks[index].priority ==
                                              'Medium')
                                            Image.asset(
                                                "assets/images/orangeflag.png")
                                          else
                                            Image.asset(
                                                "assets/images/redflag.png")
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        '${tasks[index].priority}',
                                        style: TextStyle(fontSize: 8),
                                      ),
                                    )
                                  ],
                                ),
                                // Add your other task information here
                              ],
                            ),
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

void main() {
  runApp(MyApp());
}
