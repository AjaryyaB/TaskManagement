import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taskmanagement/Dashboard.dart';
import 'package:taskmanagement/Login.dart';
import 'package:taskmanagement/constants/AppConstants.dart';
import 'package:taskmanagement/constants/BackgroundImage.dart';
import 'package:taskmanagement/constants/AppConstants.dart';
import 'package:taskmanagement/constants/Toast.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        body: BackgroundStack(
            child: Center(
      child: Container(
        width: screenWidth * 0.85,
        height: screenHeight * 0.75,

          decoration: BoxDecoration(
            color: AppConstants.cardbackground,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
         Image.asset("assets/images/Task-Management@2x.png",width: screenWidth*0.7,),
             SizedBox(height: screenHeight*0.04,),
              Text("Task Management",style: TextStyle(
                fontSize:32,
                color: AppConstants.boldBlue,
                fontWeight: FontWeight.bold,

              ),),
              SizedBox(height: screenHeight*0.01,),
              Text('''Designed to help you to better
        manage of your task''',
                style: TextStyle(
                fontSize:19,
                  color: Colors.grey

              ),),
              SizedBox(height: screenHeight*0.05,),
              SizedBox(
                width: screenWidth * 0.60,
                height: screenHeight * 0.06,

                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      // Set the background color of the button
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    backgroundColor: AppConstants.boldBlue,
                  ),
                  onPressed: () {

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Login()),
                    );
                    Toastify.successToast(context, "http://192.168.5.214:8080/taskManagement/getAllEntityDetails");

                  },
                  child: Text("Let's Start",style: TextStyle(
                    fontSize:18,

                  ),),
                ),
              )


            ],
      ),
          ),
      ),
    )));
  }
}
