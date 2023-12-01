import 'package:flutter/material.dart';
import 'package:taskmanagement/constants/AppConstants.dart';
import 'package:taskmanagement/constants/BackgroundImage.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: BackgroundStack(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Image.asset("assets/images/logo.png")],
        ),
        SizedBox(
          height: screenSize.height * 0.050,
        ),
        Container(
          constraints: BoxConstraints(maxWidth: 320),
          width: screenSize.width * 0.8, // 80% of screen width
          height: screenSize.height * 0.65, // 60% of screen height

          child: Card(
            color: AppConstants.cardLightColor,
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(20.0), // Adjust the value as needed
            ),
            elevation: 5, // Add elevation for a shadow effect
            child:const Padding(
              padding:  EdgeInsets.all(18.0),
              child:  Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding:  EdgeInsets.all(18.0),
                        child: Text("Sign in",
                            style: TextStyle(
                                color: AppConstants.boldBlue,
                                fontSize: 28,
                                fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Align(
                        alignment:Alignment.centerLeft,
                        child: Text("Username",
                            style: TextStyle(
                              color: AppConstants.boldBlue,
                              fontSize: 18
                            )),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        )
      ])),
    );
  }
}
