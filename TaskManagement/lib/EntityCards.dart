import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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

class EntityCard extends StatelessWidget {
  final Entity entity;

  EntityCard({required this.entity});

  @override
  Widget build(BuildContext context) {
    //double cardHeight = 150.0;
    return Card(
      margin: EdgeInsets.all(10),
      child: Container(
       // height: cardHeight,
        width: 160,

        child: ListTile(
          title: Text(entity.entityName),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Open: ${entity.open}'),
              Text('In Progress: ${entity.inProgress}'),
              Text('Overdue: ${entity.overdue}'),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Entity> entities = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final response = await http.get(
          Uri.parse('http://192.168.5.214:8080/taskManagement/getAllEntityDetails'));

      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);
        List<Entity> entityList = data.map((item) => Entity(
          entityId: item['entityId'],
          entityName: item['entityName'],
          open: item['open'],
          inProgress: item['inprogress'],
          overdue: item['overdue'],
        )).toList();

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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // appBar: AppBar(
        //   title: Text('Entities Task Status'),
        // ),
        body: entities.isEmpty
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: entities.length,
          itemBuilder: (context, index) {
            return EntityCard(entity: entities[index]);
          },
        ),
      ),
    );
  }
}
