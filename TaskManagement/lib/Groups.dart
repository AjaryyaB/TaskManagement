import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taskmanagement/CreateEntity.dart';
import 'package:taskmanagement/CreateGroup.dart';
import 'package:taskmanagement/constants/AppConstants.dart';
import 'package:taskmanagement/constants/BackgroundImage.dart';

class Groups extends StatefulWidget {
  const Groups({super.key});

  @override
  State<Groups> createState() => _GroupsState();
}

class _GroupsState extends State<Groups> {
  final Map<String, dynamic> groupData = {
    "groups": [
      {"createDate": "2023-12-13", "groupName": "Group 1","taskName":"Meeting scheduled", "groupStatus":"inactive"},
      {"createDate": "2023-12-13", "groupName": "Group 2","taskName":"Meeting scheduled", "groupStatus":"active"},
      {"createDate": "2023-12-13", "groupName": "Group 3","taskName":"Meeting scheduled", "groupStatus":"inactive"},
      {"createDate": "2023-12-13", "groupName": "Group 3","taskName":"Meeting scheduled", "groupStatus":"active"}
      // Add more groups as needed
    ]
  };

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: BackgroundStack(
          child: SafeArea(
              child:Column(
                children: [
                  SizedBox(
                    height: screenHeight*0.03,
                  ),
                  AppBar(
                    title: const Text("Groups"),
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                  ),
                  SizedBox(
                    height: screenHeight*0.02,
                  ),
                  Expanded(child:
                  Container(
                    width: screenWidth,
                    decoration: BoxDecoration(
                        color:AppConstants.cardbackground,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0),
                        )
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top:18.0,right: 5),
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: AppConstants.boldBlue,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0), // Set the border radius here
                                  ),
                                  minimumSize: Size(200, 52),// Set the background color here
                                ),
                                onPressed: (){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => CreateGroup()),
                                  );

                                }, child: Text("Create Group")),
                          ),
                        ),
                        SizedBox(height: screenHeight *0.02,),

                        // Iterate through each group and create a widget for each
                        for (var group in groupData['groups'])
                          GroupWidget(
                            createDate: group['createDate'],
                            groupName: group['groupName'],
                            taskName: group['taskName'],
                            groupStatus: group['groupStatus'],
                          ),
                      ],
                    ),
                  )
                  )

                ],
              )
          )
      ),
    );
  }
}
class GroupWidget extends StatelessWidget {
  final String createDate;
  final String groupName;
  final String taskName;
  final String groupStatus;

  const GroupWidget({
    Key? key,
    required this.createDate,
    required this.groupName,
    required this.taskName,
    required this.groupStatus,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      height:screenHeight*0.1 ,
      width: screenWidth*0.95,
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0), // Adjust the radius as needed
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SizedBox(width: screenWidth*0.01,),
                Image.asset(
                  "assets/images/taskprofile.png",
                ),
                SizedBox(width: screenWidth*0.01,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(groupName),
                    Text(taskName),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(createDate),
                  //Text(groupStatus),
                  if (groupStatus == 'active')
                    Image.asset(
                        "assets/images/greenflag.png")
                  else
                    Image.asset(
                        "assets/images/redflag.png")

                ],
              ),
            )

          ],

        ),
      ),
    );
  }
}
