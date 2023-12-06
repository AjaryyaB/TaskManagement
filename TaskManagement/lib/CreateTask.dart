import 'package:flutter/material.dart';
import 'package:taskmanagement/constants/AppConstants.dart';
import 'package:taskmanagement/constants/BackgroundImage.dart';
import 'package:taskmanagement/constants/BuildCalenderTextField.dart';
import 'package:taskmanagement/constants/BuildDescriptionTextBox.dart';
import 'package:taskmanagement/constants/BuildDropdown.dart';
import 'package:taskmanagement/constants/BuildLabelText.dart';
import 'package:taskmanagement/constants/BuildTextFormField.dart';

class CreateTask extends StatefulWidget {
  const CreateTask({super.key});

  @override
  State<CreateTask> createState() => _CreateTaskState();
}

class _CreateTaskState extends State<CreateTask> {
  String? selectedTaskType;
  String? selectedGroup;
  List<String> taskTypes = ['Task Type 1', 'Task Type 2', 'Task Type 3'];

  List<String> groups = ['Group 1', 'Group 2', 'Group 3'];
  List<String> assignees = ['Assignee 1', 'Assignee 2', 'Assignee 3'];
  TextEditingController taskTitleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  void onTaskTypeChanged(String? value) {
    setState(() {
      selectedTaskType = value;
    });
  }

  void onGroupChanged(String? value) {
    setState(() {
      selectedGroup = value;
    });
  }

  void onPriorityChanged(int? value) {
    setState(() {
      _selectedRadio = value as int;
    });
    print("_selectedRadio : ${radioLabels[_selectedRadio]}");
  }

  DateTime? _selectedDate;

  void onDateSelected(DateTime? value) {
    _selectedDate = value;
    print("_selectedDate : $_selectedDate");
  }

  int _selectedRadio = 0;
  List<String> radioLabels = ['High', 'Medium', 'Low'];

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final scrollContent = Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppBar(
          title: const Text("Create Task"),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        Padding(
            padding: const EdgeInsets.only(top: 36.0),
            child: Container(
                decoration: const BoxDecoration(
                  color: AppConstants.cardbackground,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                ),
                child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      children: [
                        BuildLabelText.buildLabelText("Task Type"),

                        SizedBox(height: screenSize.height * 0.02),
                        BuildDropdown.buildDropdown(
                            taskTypes, "Select Task Type", onTaskTypeChanged),
                        SizedBox(height: screenSize.height * 0.02),
                        BuildLabelText.buildLabelText("Task Title"),
                        SizedBox(height: screenSize.height * 0.02),

                        BuildTextFormField.buildTextFormField(
                            'Enter Task Title',
                            const SizedBox(),
                            taskTitleController),
                        // Task Title TextField

                        SizedBox(height: screenSize.height * 0.02),
                        BuildLabelText.buildLabelText("Group"),
                        SizedBox(height: screenSize.height * 0.02),
                        // Group Dropdown
                        BuildDropdown.buildDropdown(
                            taskTypes, "Select Group", onGroupChanged),
                        // Priority Selector
                        SizedBox(height: screenSize.height * 0.02),
                        BuildLabelText.buildLabelText("Add Assignee"),
                        SizedBox(height: screenSize.height * 0.02),
                        // Group Dropdown
                        BuildDropdown.buildDropdown(
                            assignees, "Select Assignee", onGroupChanged),
                        SizedBox(height: screenSize.height * 0.02),
                        Container(
                          constraints: const BoxConstraints(
                              maxWidth: 380, maxHeight: 30),
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: radioLabels.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Row(
                                children: <Widget>[
                                  Radio(
                                    value: index,
                                    groupValue: _selectedRadio,
                                    onChanged: onPriorityChanged,
                                    activeColor: Colors
                                        .red, // Changes the selected dot color to red
                                  ),
                                  Text(radioLabels[index]),
                                  SizedBox(width: 8),
                                ],
                              );
                            },
                          ),
                        ),
                        SizedBox(height: screenSize.height * 0.02),

                        CalendarTextField(onDateSelected: onDateSelected),
                        SizedBox(height: screenSize.height * 0.02),

                        DescriptionTextArea.buildDescriptionTextArea(
                            descriptionController),
                        SizedBox(height: screenSize.height * 0.02),
                        // Add Documents Button
                        TextButton(
                          onPressed: () {
                            // Handle Add Documents
                          },
                          child: const Text('Attach'),
                        ),
                        SizedBox(height: screenSize.height * 0.02),

                        // Submit Button
                        ElevatedButton(
                          onPressed: () {
                            // Handle form submission
                          },
                          child: const Text('Submit'),
                        ),
                      ],
                    )))),
      ],
    );
    bool isLargerScreen = screenSize.height > 600;
    return Scaffold(
        body: BackgroundStack(
            child: SingleChildScrollView(
      child: isLargerScreen
          ? Container(

              child:scrollContent,
            )
          : Container(

              child: scrollContent,
            ),
    )));
  }
}
