import 'package:flutter/material.dart';
import 'package:taskmanagement/constants/AppConstants.dart';

// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Task List',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: TaskListPage(),
//     );
//   }
// }

class TaskListPage extends StatefulWidget {
  @override
  _TaskListPageState createState() => _TaskListPageState();
}

class _TaskListPageState extends State<TaskListPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, // Allow the app bar to be transparent
      appBar: AppBar(
        title: Text('Task List'),
        backgroundColor: Colors.transparent, // Make the app bar transparent
        elevation: 0, // Remove shadow
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(child: Text("Open",style: TextStyle(color: Colors.black),)),
            Tab(text: 'Overdue'),
            Tab(text: 'Closed'),
          ],
          automaticIndicatorColorAdjustment: true,
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppConstants.backgroundImage,), // Replace with your background image
                fit: BoxFit.cover, // Cover the entire widget with the image
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: kToolbarHeight + MediaQuery.of(context).padding.top),
            child: Card(
              color: AppConstants.cardbackground,
              // margin: EdgeInsets.all(8.0), // Adjust the margin as needed
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),// Round the corners as needed
              ),

              child: TabBarView(
                controller: _tabController,
                children: [
                  TaskListView(taskStatus: 'Open'),
                  TaskListView(taskStatus: 'Overdue'),
                  TaskListView(taskStatus: 'Closed'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// The rest of the code remains the same


class TaskListView extends StatelessWidget {
  final String taskStatus;

  TaskListView({required this.taskStatus});

  @override
  Widget build(BuildContext context) {
    // Replace with your data source
    List<Task> tasks = List.generate(
      20,
          (index) => Task(
        name: 'Alisa Fox $taskStatus',
        date: '31/08/2018',
        priority: (['High', 'Medium', 'Low']..shuffle()).first,
      ),
    );

    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        return TaskListTile(task: tasks[index]);
      },
    );
  }
}

class TaskListTile extends StatelessWidget {
  final Task task;

  TaskListTile({required this.task});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        // Replace with your image resource
        backgroundImage: AssetImage('assets/avatar_placeholder.png'),
      ),
      title: Text(task.name),
      subtitle: Text(task.date),
      trailing: _buildPriorityChip(task.priority),
    );
  }

  Widget _buildPriorityChip(String priority) {
    Color color;
    switch (priority) {
      case 'High':
        color = Colors.red;
        break;
      case 'Medium':
        color = Colors.orange;
        break;
      case 'Low':
        color = Colors.green;
        break;
      default:
        color = Colors.grey;
    }
    return Chip(
      label: Text(
        priority,
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: color,
    );
  }
}

class Task {
  String name;
  String date;
  String priority;

  Task({required this.name, required this.date, required this.priority});
}
