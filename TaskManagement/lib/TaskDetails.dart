import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taskmanagement/constants/AppConstants.dart';
import 'package:taskmanagement/constants/BackgroundImage.dart';

class TaskDetails extends StatefulWidget {
  const TaskDetails({super.key});

  @override
  State<TaskDetails> createState() => _TaskDetailsState();
}

class _TaskDetailsState extends State<TaskDetails> {
  final Map<String, dynamic> taskData = {
      "TaskName": "Meeting with client",
    "startDate": "2023-12-12",
    "assignee": {
      "name": "John Doe",
      "designation": "Senior Developer",
      "mobileNumber": "9848022338",
    },
    "priority": "High",
    "description": "Finish and submit the project report by the deadline.Finish and submit the project report by the deadline.Finish and submit the project report by the deadline."
  };
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: BackgroundStack(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: screenHeight*0.03,
              ),
              AppBar(
                title: const Text("Task Details"),
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
              SizedBox(
                height: screenHeight*0.02,
              ),

              Expanded(
                child: Container(
                  width: screenWidth,
                  decoration: BoxDecoration(
                    color: AppConstants.cardbackground,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),

                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 40.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      //crossAxisAlignment: ,
                      children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left:18.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('${taskData["TaskName"]}', style: TextStyle(

                                        fontSize:18,
                                          fontWeight:  FontWeight.bold,
                                          color: AppConstants.boldBlue
                                        ),
                                        ),
                                        SizedBox(height:10),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Icon(Icons.calendar_month,size: 16,),
                                            SizedBox(width: 5,),
                                            Text('${taskData["startDate"]}',style: TextStyle(
                                              fontSize: 12,
                                              color: AppConstants.boldBlue,
                                            ),)
                                          ],
                                        ),

                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 18),
                                    child: CircleAvatar(
                                      radius: 25,
                                      backgroundColor: Colors.white, // Set the background color to white
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center, // Center the content vertically
                                        children: [
                                          // Conditionally display icons based on priority
                                          Image.asset(
                                            taskData["priority"] == 'Low'
                                                ? "assets/images/greenflag.png"
                                                : (taskData["priority"] == 'Medium'
                                                ? "assets/images/orangeflag.png"
                                                : "assets/images/redflag.png"),
                                          ),
                                          SizedBox(height: 5), // Add some space between the image and text
                                          Text(
                                            '${taskData["priority"]}',
                                            style: TextStyle(fontSize: 14,color: AppConstants.boldBlue),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                        Padding(
                          padding: const EdgeInsets.only(left:18.0,top: 18),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 25,
                                backgroundImage: AssetImage('assets/images/profile@2x.png'),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 15.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text("${taskData["assignee"]["name"]}",style: TextStyle(
                                          fontSize: 14,
                                          color: AppConstants.boldBlue1,
                                          fontWeight: FontWeight.bold,
                                        ),),

                                        Text("${taskData["assignee"]["designation"]}",style:TextStyle(
                                          fontSize: 12,
                                          color: AppConstants.subTextColor,
                                        )),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Icon(Icons.phone,size: 16,),
                                        SizedBox(width: 5,),
                                        Text("${taskData["assignee"]["mobileNumber"]}",style:TextStyle(
                                          fontSize: 12,
                                          color: AppConstants.boldBlue,
                                          fontWeight: FontWeight.bold,
                                        )),
                                      ],
                                    ),

                                  ],
                                ),
                              )

                            ],
                          ),
                        ),
                       Padding(
                         padding: const EdgeInsets.only(top:30.0,left:18),
                         child: Column(
                            //mainAxisAlignment: MainAxisAlignment.start,
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Text("Description",style:TextStyle(
                               fontSize: 14,
                               color: AppConstants.boldBlue,
                               fontWeight: FontWeight.bold,
                             )),
                             SizedBox(height:15),
                             Text('${taskData["description"]}',style: TextStyle(
                               fontSize: 14,
                               color:AppConstants.boldBlue1,
                             )),

                           ],
                         ),
                       ),
                        Padding(
                          padding: const EdgeInsets.only(top: 30.0, left: 18),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Documents", style: TextStyle(
                                fontSize: 14,
                                color: AppConstants.boldBlue,
                                fontWeight: FontWeight.bold,
                              )),
                              SizedBox(height: 15),
                              Align(
                                alignment: Alignment.centerLeft, // Adjust the alignment as needed
                                child: TextButton(
                                  onPressed: () {},
                                  child: Text("Quotation"),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top:18.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: AppConstants.tabHeaderText,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0), // Set the border radius here
                                  ),
                                  minimumSize: Size(140, 45),// Set the background color here
                                ),
                                onPressed: (){},
                                child: Text("Send Alert"),

                              ),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: AppConstants.tabHeaderText,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0), // Set the border radius here
                                    ),
                                    minimumSize: Size(160, 45),// Set the background color here
                                  ),
                                  onPressed: (){},
                                  child: Text("Send Message")
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: AppConstants.boldBlue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0), // Set the border radius here
                              ),
                              minimumSize: Size(200, 45),// Set the background color here
                            ),
                            onPressed: (){}, child: Text("Update Task")),
                        Expanded(child: SizedBox())
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ) ;
  }
}
