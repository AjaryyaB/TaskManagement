import 'package:flutter/material.dart';
import 'package:taskmanagement/constants/BackgroundImage.dart';

class CreateTask extends StatefulWidget {
  const CreateTask({super.key});

  @override
  State<CreateTask> createState() => _CreateTaskState();
}

class _CreateTaskState extends State<CreateTask> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: BackgroundStack(
          child: ListView(
            children: [Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: AppBar(
                    title: Text("Create Task"),
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                  ),
                ),
                Container(
                  width: screenSize.width , // 80% of screen width

                  child: Expanded(child: Card()),
                )
              ],
            )],
          )),
    );
  }
}
