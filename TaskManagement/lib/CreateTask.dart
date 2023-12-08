import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:taskmanagement/Dashboard.dart';
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

  void _openFileExplorer() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      // Do something with the selected files (result.files)
      // For example, you can get the paths of the selected files:
      List<String> filePaths = result.paths.map((path) => path!).toList();
      print('Selected files: $filePaths');
    } else {
      // User canceled the file picker
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final scrollContent = Column(
      children: [
        AppBar(
          title: const Text("Create Task"),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        Padding(
            padding: const EdgeInsets.only(top: 0),
            child: Container(
                decoration: const BoxDecoration(
                  color: AppConstants.cardbackground,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                ),
                child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        BuildLabelText.buildLabelText("Task Type"),

                        SizedBox(height: screenSize.height * 0.01),
                        BuildDropdown.buildDropdown(
                            taskTypes, "Select Task Type", onTaskTypeChanged),
                        SizedBox(height: screenSize.height * 0.01),
                        BuildLabelText.buildLabelText("Task Title"),
                        SizedBox(height: screenSize.height * 0.01),

                        BuildTextFormField.buildTextFormField(
                            'Enter Task Title',
                            const SizedBox(),
                            taskTitleController),
                        // Task Title TextField

                        SizedBox(height: screenSize.height * 0.01),
                        BuildLabelText.buildLabelText("Group"),
                        SizedBox(height: screenSize.height * 0.01),
                        // Group Dropdown
                        BuildDropdown.buildDropdown(
                            taskTypes, "Select Group", onGroupChanged),
                        // Priority Selector
                        SizedBox(height: screenSize.height * 0.01),

                        // Group Dropdown

                        BuildLabelText.buildLabelText("Priority"),
                        SizedBox(height: screenSize.height * 0.01),
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
                        SizedBox(height: screenSize.height * 0.01),
                        BuildLabelText.buildLabelText("Add Assignee"),
                        SizedBox(height: screenSize.height * 0.01),
                        BuildDropdown.buildDropdown(
                            assignees, "Select Assignee", onGroupChanged),

                        SizedBox(height: screenSize.height * 0.01),
                        BuildLabelText.buildLabelText("Target Date"),
                        SizedBox(height: screenSize.height * 0.01),
                        CalendarTextField(onDateSelected: onDateSelected),
                        SizedBox(height: screenSize.height * 0.01),
                        BuildLabelText.buildLabelText("Description"),
                        SizedBox(height: screenSize.height * 0.01),
                        DescriptionTextArea.buildDescriptionTextArea(
                            descriptionController),
                        SizedBox(height: screenSize.height * 0.01),
                        // Add Documents Button
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Add Documents",
                              style: TextStyle(
                                color: AppConstants.lightGrey,
                              ),
                            ),
                            GestureDetector(
                              onTap: _openFileExplorer,
                              child: Text(
                                "+Attach",
                                style: TextStyle(
                                  color: AppConstants.boldBlue,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: screenSize.height * 0.01),

                        // Submit Button
                        SizedBox(
                          width: screenSize.width * 0.60,
                          height: screenSize.height * 0.06,
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
                                MaterialPageRoute(
                                    builder: (context) => Dashboard()),
                              );
                            },
                            child: Text(
                              "Submit",
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )))),
      ],
    );

    return Scaffold(
        body: BackgroundStack(
            child: SingleChildScrollView(
                child: GestureDetector(
      onTap: () {
        // Unfocus the current focus when tapped outside the TextFormField
        FocusScope.of(context).unfocus();
      },
      child: Container(
        child: scrollContent,
      ),
    ))));
  }
}
