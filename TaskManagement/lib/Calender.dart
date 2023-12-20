import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:taskmanagement/constants/AppConstants.dart';
import 'package:taskmanagement/constants/BackgroundImage.dart';
import 'package:taskmanagement/constants/BuildLabelText.dart';
import 'package:taskmanagement/constants/BuildTextFormField.dart';

class Calender extends StatefulWidget {
  const Calender({super.key});

  @override
  State<Calender> createState() => _CalenderState();
}

class _CalenderState extends State<Calender> {
  final Map<String, dynamic> Tasks = {
    "tasks": [
      {
        "Name": "Jonah",
        "Designation": "CEO",
        "TaskType": "meeting scheduled",
        "priority": "high"
      },
      {
        "Name": "Sarah",
        "Designation": "CTO",
        "TaskType": "meeting scheduled",
        "priority": "low"
      },
      {
        "Name": "Henry",
        "Designation": "CRO",
        "TaskType": "meeting scheduled",
        "priority": "medium"
      },
      {
        "Name": "Jonah",
        "Designation": "CEO",
        "TaskType": "meeting scheduled",
        "priority": "high"
      },
      {
        "Name": "Sarah",
        "Designation": "CTO",
        "TaskType": "meeting scheduled",
        "priority": "low"
      },
      {
        "Name": "Henry",
        "Designation": "CRO",
        "TaskType": "meeting scheduled",
        "priority": "medium"
      },
    ]
  };

  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        body: BackgroundStack(
            child: SafeArea(
                child: Column(
      children: [
        SizedBox(
          height: screenHeight * 0.03,
        ),
        AppBar(
            title: const Text("Calender"),
            backgroundColor: Colors.transparent,
            elevation: 0),
        SizedBox(height: screenHeight * 0.02),
        Expanded(
          child: Container(
            //  color: AppConstants.cardbackground,
            decoration: const BoxDecoration(
              color: AppConstants.cardbackground,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
            ),
            child: Container(
              decoration: const BoxDecoration(
                color: AppConstants.cardbackground,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                    child: Column(
                  children: [
                    Card(
                      elevation: 5,
                      child: SizedBox(
                        //width: screenWidth * 0.33,
                        height: screenHeight * 0.33,
                        child: Expanded(
                          child: SfDateRangePicker(
                            view: DateRangePickerView.month,
                            selectionMode: DateRangePickerSelectionMode.range,
                            // selectionShape: ,
                          ),
                        ),
                      ),
                    ),
                    Text("This week Schedules"),
                    SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: [
                          for (var group in Tasks['tasks'])
                            TaskWidget(
                              Name: group['Name'],
                              Designation: group['Designation'],
                              TaskType: group['TaskType'],
                              priority: group['priority'],
                            ),
                        ],
                      ),
                    )
                  ],
                )),
              ),
            ),
          ),
        ),
      ],
    ))));
  }
}

class TaskWidget extends StatelessWidget {
  final String Name;
  final String Designation;
  final String TaskType;
  final String priority;

  const TaskWidget({
    Key? key,
    required this.Name,
    required this.Designation,
    required this.TaskType,
    required this.priority,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      height: screenHeight * 0.1,
      width: screenWidth * 0.95,
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(20.0), // Adjust the radius as needed
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SizedBox(
                  width: screenWidth * 0.01,
                ),
                Image.asset(
                  "assets/images/taskprofile.png",
                ),
                SizedBox(
                  width: screenWidth * 0.01,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(Name),
                    Text(TaskType),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
               // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Text(groupStatus),
                  if (priority == 'high')
                    Image.asset("assets/images/redflag.png")
                  else if (priority == 'medium')
                    Image.asset("assets/images/greenflag.png")
                  else
                    Image.asset("assets/images/orangeflag.png"),

                  Text(priority),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
