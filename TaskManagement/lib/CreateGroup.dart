import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taskmanagement/constants/AppConstants.dart';
import 'package:taskmanagement/constants/BackgroundImage.dart';
import 'package:taskmanagement/constants/BuildCalenderTextField.dart';
import 'package:taskmanagement/constants/BuildDescriptionTextBox.dart';
import 'package:taskmanagement/constants/BuildDropdown.dart';
import 'package:taskmanagement/constants/BuildLabelText.dart';
import 'package:taskmanagement/constants/BuildTextFormField.dart';
import 'package:taskmanagement/constants/DropDownMultiSelection.dart';

class CreateGroup extends StatefulWidget {
  const CreateGroup({super.key});

  @override
  State<CreateGroup> createState() => _CreateGroupState();
}

class _CreateGroupState extends State<CreateGroup> {
  String? selectedGroupStatus;
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();


  List<String> groupStatus = ['Active', 'InActive'];
  DateTime? _selectedDate;

  void onGroupStatusChanged(String? value) {
    setState(() {
      selectedGroupStatus = value;
    });
  }

  void onStartDate(DateTime? value) {
    _selectedDate = value;
    print("_selectedDate : $_selectedDate");
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
                        title: const Text("Create Group"),
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
                                      'Name', const SizedBox(), nameController),
                                  SizedBox(height: screenHeight * 0.02,),
                                  BuildLabelText.buildLabelText("Description"),
                                  SizedBox(height: screenHeight * 0.01,),
                                  DescriptionTextArea.buildDescriptionTextArea(
                                      descriptionController),
                                  SizedBox(height: screenHeight * 0.02,),
                                  BuildLabelText.buildLabelText("Start Date"),
                                  SizedBox(height: screenHeight * 0.01,),
                                  CalendarTextField(onDateSelected: onStartDate),
                                  SizedBox(height: screenHeight * 0.02,),
                                  BuildLabelText.buildLabelText("Start Date"),
                                  SizedBox(height: screenHeight * 0.01,),
                                  BuildDropdown.buildDropdown(
                                      groupStatus, "Select Task Type", onGroupStatusChanged),
                                  SizedBox(height: screenHeight * 0.02,),
                                  MyDropdown(
                                    dropdownItems: ['Entity one', 'Entity Two', 'Entity Three'],
                                    hintText: 'Select Entity',
                                  ),
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
