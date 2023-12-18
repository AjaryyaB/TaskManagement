import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taskmanagement/constants/AppConstants.dart';
import 'package:taskmanagement/constants/BackgroundImage.dart';
import 'package:taskmanagement/constants/BuildDropdown.dart';
import 'package:taskmanagement/constants/BuildLabelText.dart';
import 'package:taskmanagement/constants/BuildTextFormField.dart';

class CreateUsers extends StatefulWidget {
  const CreateUsers({super.key});

  @override
  State<CreateUsers> createState() => _CreateUsersState();
}

class _CreateUsersState extends State<CreateUsers> {
  String? selectedRole;
  TextEditingController userNameController = TextEditingController();
  TextEditingController userEmailController = TextEditingController();
  TextEditingController userMobileController = TextEditingController();
  TextEditingController userPasswordController = TextEditingController();


  List<String> roles = ['SuperAdmin', 'Admin', 'User'];

  void onSelectRole(String? value) {
    setState(() {
      selectedRole = value;
    });
  }

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
                      height: screenHeight * 0.03,
                    ),
                    AppBar(
                        title: const Text("Create User"),
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
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: screenHeight * 0.02,),
                                  BuildLabelText.buildLabelText("Name"),
                                  SizedBox(height: screenHeight * 0.01,),
                                  BuildTextFormField.buildTextFormField(
                                      'Enter Name', const SizedBox(), userNameController),
                                  SizedBox(height: screenHeight * 0.02,),
                                  BuildLabelText.buildLabelText("Email"),
                                  SizedBox(height: screenHeight * 0.01,),
                                  BuildTextFormField.buildTextFormField('Enter Email',
                                      const SizedBox(), userEmailController),
                                  SizedBox(height: screenHeight * 0.02,),
                                  BuildLabelText.buildLabelText("Mobile"),
                                  SizedBox(height: screenHeight * 0.01,),
                                  BuildTextFormField.buildTextFormField('Enter Mobile',
                                      const SizedBox(), userMobileController),
                                  SizedBox(height: screenHeight * 0.02,),
                                  BuildLabelText.buildLabelText("Password"),
                                  SizedBox(height: screenHeight * 0.01,),
                                  BuildTextFormField.buildTextFormField('Enter Password',
                                      const SizedBox(), userPasswordController),
                                  SizedBox(height: screenHeight * 0.02,),
                                  BuildLabelText.buildLabelText("Role"),
                                  SizedBox(height: screenHeight * 0.01,),
                                  BuildDropdown.buildDropdown(
                                      roles, "Select Role", onSelectRole),
                                  SizedBox(height: screenHeight * 0.02,),


                                  SizedBox(height: screenHeight * 0.02,),
                                  Align(
                                    alignment: Alignment.center,
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          primary: AppConstants.boldBlue,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                10.0), // Set the border radius here
                                          ),
                                          minimumSize:
                                          Size(200, 52), // Set the background color here
                                        ),
                                        onPressed: () {},
                                        child: Text("Submit")),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ))));
  }
}
