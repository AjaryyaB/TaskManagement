import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taskmanagement/CreateEntity.dart';
import 'package:taskmanagement/CreateUsers.dart';
import 'package:taskmanagement/constants/AppConstants.dart';
import 'package:taskmanagement/constants/BackgroundImage.dart';

class Users extends StatefulWidget {
  const Users({super.key});

  @override
  State<Users> createState() => _UsersState();
}

class _UsersState extends State<Users> {
  final Map<String, dynamic> entityData = {
    "users": [
      {"userName": "Sarah", "entityName": "Entity 1","designation":"ceo"},
      {"userName": "Henry", "entityName": "Entity 2","designation":"cto"},
      {"userName": "Joyce", "entityName": "Entity 3","designation":"coo"},
      {"userName": "Victor", "entityName": "Entity 1","designation":"ceo"},
      {"userName": "Daniel", "entityName": "Entity 2","designation":"cto"},
      {"userName": "Joseph", "entityName": "Entity 3","designation":"coo"}
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
                    title: const Text("Users"),
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
                                    MaterialPageRoute(builder: (context) => CreateUsers()),
                                  );

                                }, child: Text("Create User")),
                          ),
                        ),
                        SizedBox(height: screenHeight *0.02,),

                        // Iterate through each group and create a widget for each
                        for (var group in entityData['users'])
                          UserWidget(
                            userName: group['userName'],
                            entityName: group['entityName'],
                              designation: group['designation']
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
class UserWidget extends StatelessWidget {
  final String userName;
  final String entityName;
  final String designation;

  const UserWidget({
    Key? key,
    required this.userName,
    required this.entityName,
    required this.designation,
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
          children: [
            SizedBox(width: screenWidth*0.02,),
            Image.asset(
              "assets/images/profile.png",
            ),
            SizedBox(width: screenWidth*0.02,),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(userName),
                    SizedBox(width: screenWidth*0.01,),
                    Text(designation),
                  ],
                ),
                Text(entityName)
              ],
            )
          ],

        ),
      ),
    );
  }
}
