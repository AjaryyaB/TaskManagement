import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taskmanagement/CreateEntity.dart';
import 'package:taskmanagement/constants/AppConstants.dart';
import 'package:taskmanagement/constants/BackgroundImage.dart';

class AllEntity extends StatefulWidget {
  const AllEntity({super.key});

  @override
  State<AllEntity> createState() => _AllEntityState();
}

class _AllEntityState extends State<AllEntity> {
  final Map<String, dynamic> entityData = {
    "entities": [
      {"createDate": "2023-12-13", "entityName": "Entity 1"},
      {"createDate": "2023-12-13", "entityName": "Entity 2"},
      {"createDate": "2023-12-13", "entityName": "Entity 3"}
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
                title: const Text("Entities"),
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
                                MaterialPageRoute(builder: (context) => CreateEntity()),
                              );

                            }, child: Text("Create Entity")),
                      ),
                    ),
                    SizedBox(height: screenHeight *0.02,),

                    // Iterate through each group and create a widget for each
                    for (var group in entityData['entities'])
                      EntityWidget(
                        createDate: group['createDate'],
                        entityName: group['entityName'],
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
class EntityWidget extends StatelessWidget {
  final String createDate;
  final String entityName;

  const EntityWidget({
    Key? key,
    required this.createDate,
    required this.entityName,
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
            SizedBox(width: screenWidth*0.01,),
            Image.asset(
              "assets/images/Group4624@3x.png",
            ),
            SizedBox(width: screenWidth*0.01,),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(entityName),
                Text(createDate),
              ],
            )
          ],

        ),
      ),
    );
  }
}
