// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
//
// import 'package:taskmanagement/constants/AppConstants.dart';
//
// class Entity {
//   int entityId;
//   String entityName;
//   int open;
//   int inProgress;
//   int overdue;
//
//   Entity({
//     required this.entityId,
//     required this.entityName,
//     required this.open,
//     required this.inProgress,
//     required this.overdue,
//   });
// }
//
// class EntityCard extends StatelessWidget {
//   final Entity entity;
//
//   EntityCard({required this.entity});
//
//   @override
//   Widget build(BuildContext context) {
//     double cardHeight = MediaQuery.of(context).size.height * 0.2;
//     double cardWidth = MediaQuery.of(context).size.width * 0.4;
//
//     return Card(
//       margin: EdgeInsets.all(10),
//       child: Container(
//         height: cardHeight,
//         width: cardWidth,
//         child: ListTile(
//           title: Text(entity.entityName),
//           subtitle: Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text('Open: ${entity.open}'),
//               Text('In Progress: ${entity.inProgress}'),
//               Text('Overdue: ${entity.overdue}'),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: MyHomePage(),
//       ),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   List<Entity> entities = [];
//
//   @override
//   void initState() {
//     super.initState();
//     fetchData();
//   }
//
//   Future<void> fetchData() async {
//     try {
//       final response = await http.get(Uri.parse(
//           'http://192.168.5.214:8080/taskManagement/getAllEntityDetails'));
//
//       if (response.statusCode == 200) {
//         List<dynamic> data = jsonDecode(response.body);
//         List<Entity> entityList = data
//             .map((item) => Entity(
//           entityId: item['entityId'],
//           entityName: item['entityName'],
//           open: item['open'],
//           inProgress: item['inprogress'],
//           overdue: item['overdue'],
//         ))
//             .toList();
//
//         setState(() {
//           entities = entityList;
//         });
//       } else {
//         throw Exception(
//             'Failed to load data. Status Code: ${response.statusCode}, Error: ${response.body}');
//       }
//     } catch (error) {
//       print("Error: $error");
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: AppConstants.cardbackground,
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(20.0),
//           topRight: Radius.circular(20.0),
//         ),
//       ),
//       child: entities.isEmpty
//           ? Center(child: CircularProgressIndicator())
//           : ListView.builder(
//         scrollDirection: Axis.horizontal,
//         itemCount: entities.length,
//         itemBuilder: (context, index) {
//           return EntityCard(entity: entities[index]);
//         },
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:taskmanagement/constants/AppConstants.dart';
import 'package:taskmanagement/constants/AppConstants.dart';
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
        margin: EdgeInsets.all(10),
        child: Container(
          width: 240,
          height: 120,
          decoration: BoxDecoration(
            border: Border.all(
              color: isSelected ? AppConstants.boldBlue : Colors.transparent,
              width: 2.0,
            ),
              borderRadius: BorderRadius.all(Radius.circular(20))
          ),
          child: ListTile(
            title: Text(
              entity.entityName,
              style: TextStyle(
                color: isSelected ? AppConstants.boldBlue : Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 24
              ),
            ),
            subtitle: Column(
              children: [
                SizedBox(height: 10,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [Text('Open'), Text('${entity.open}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 23,
                            color:Colors.green
                      ))],
                    ),
                    SizedBox(width: 20,),
                    Column(
                      children: [Text('InProgress'), Text('${entity.inProgress}',
                        style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 23,
                        color:Colors.deepOrange
                      ),)],
                    ),
                    SizedBox(width: 20,),
                    Column(
                      children: [Text('Overdue: '), Text('${entity.overdue}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 23,
                            color:Colors.red
                      ))],
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
  Entity? selectedEntity; // Keep track of the selected entity

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    Toastify.successToast(context, "Login Success");
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
    return Container(
      child: Column(
        children: [
          SizedBox(height: 10,),
          entities.isEmpty
              ? Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: entities
                        .map((entity) => EntityCard(
                              entity: entity,
                              onTap: () {
                                onCardTap(entity);
                              },
                              isSelected: entity == selectedEntity,
                            ))
                        .toList(),
                  ),
                ),
          tasks.isEmpty
              ? Center(child: Text('No tasks for selected entity'))
              : ListView.builder(
                  shrinkWrap: true,
                  itemCount: tasks.length,
                  itemBuilder: (context, index) {
                    return Card(
                      margin: EdgeInsets.all(10),
                      child: ListTile(
                        title: Text('Task ID: ${tasks[index].taskId}'),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Assignee: ${tasks[index].assignee}'),
                            Text('Designation: ${tasks[index].designation}'),
                            Text('Priority: ${tasks[index].priority}'),
                            Text(
                                'Due Date: ${tasks[index].dueDate.toString()}'),
                          ],
                        ),
                      ),
                    );
                  },
                ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}
