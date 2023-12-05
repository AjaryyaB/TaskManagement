import 'package:flutter/material.dart';

class Task {
  String status;

  Task({required this.status});
}

class Company {
  String name;
  List<Task> tasks;

  Company({required this.name, required this.tasks});
}

class CompanyCard extends StatelessWidget {
  final Company company;

  CompanyCard({required this.company});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.all(10),
      child: Container(
        width: 200, // Adjust the width as needed
        child: ListTile(
          title: Text(company.name),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Tasks: ${company.tasks.length}'),
              Text('Open: ${company.tasks.where((task) => task.status == 'open').length}'),
              Text('In Progress: ${company.tasks.where((task) => task.status == 'inprogress').length}'),
              Text('Overdue: ${company.tasks.where((task) => task.status == 'overdue').length}'),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  // Replace this with the data you get from your API
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

  runApp(MyApp(companies: companies));
}

class MyApp extends StatelessWidget {
  final List<Company> companies;

  MyApp({required this.companies});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // appBar: AppBar(
        //   title: Text('Company Task Status'),
        // ),
        body: Container(
          height: 200, // Set a fixed height
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: companies.map((company) => CompanyCard(company: company)).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
