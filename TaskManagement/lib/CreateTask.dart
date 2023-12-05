import 'package:flutter/material.dart';
import 'package:taskmanagement/constants/AppConstants.dart';
import 'package:taskmanagement/constants/BackgroundImage.dart';

class CreateTask extends StatefulWidget {
  const CreateTask({super.key});

  @override
  State<CreateTask> createState() => _CreateTaskState();
}

class _CreateTaskState extends State<CreateTask> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: BackgroundStack(
          child: SingleChildScrollView(
        child: Column(
          children: [
            AppBar(
              title: Text("Create Task"),
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            Padding(
                padding: const EdgeInsets.only(top: 36.0),
                child: Container(
                    width: screenSize.width,
                    height: screenSize.height,
                    decoration: BoxDecoration(
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
                            DropdownButtonFormField<String>(
                              decoration: InputDecoration(
                                labelText: 'Task Type',
                                border: OutlineInputBorder(),
                              ),
                              items: [
                                'Task Type 1',
                                'Task Type 2',
                                'Task Type 3'
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                // Handle change
                              },
                            ),
                            SizedBox(height: 16),

                            // Task Title TextField
                            TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Task Title',
                                border: OutlineInputBorder(),
                              ),
                              onChanged: (value) {
                                // Handle change
                              },
                            ),
                            SizedBox(height: 16),

                            // Group Dropdown
                            DropdownButtonFormField<String>(
                              decoration: InputDecoration(
                                labelText: 'Group',
                                border: OutlineInputBorder(),
                              ),
                              items: [
                                'Group 1',
                                'Group 2',
                                'Group 3'
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                // Handle change
                              },
                            ),
                            SizedBox(height: 16),

                            // Priority Selector
                            Row(
                              children: <Widget>[
                                ChoiceChip(
                                  label: Text('High'),
                                  selected: false,
                                  onSelected: (bool selected) {
                                    // Handle High Priority Selection
                                  },
                                ),
                                SizedBox(width: 8),
                                ChoiceChip(
                                  label: Text('Medium'),
                                  selected: true,
                                  onSelected: (bool selected) {
                                    // Handle Medium Priority Selection
                                  },
                                ),
                                SizedBox(width: 8),
                                ChoiceChip(
                                  label: Text('Low'),
                                  selected: false,
                                  onSelected: (bool selected) {
                                    // Handle Low Priority Selection
                                  },
                                ),
                              ],
                            ),
                            SizedBox(height: 16),

                            // Target Date Picker
                            TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Target Date',
                                border: OutlineInputBorder(),
                                suffixIcon: Icon(Icons.calendar_today),
                              ),
                              onTap: () {
                                // Prevent the keyboard from appearing
                                FocusScope.of(context)
                                    .requestFocus(new FocusNode());
                                // Call Function to show DatePicker
                              },
                            ),
                            SizedBox(height: 16),

                            // Description TextField
                            TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Description',
                                border: OutlineInputBorder(),
                              ),
                              onChanged: (value) {
                                // Handle change
                              },
                            ),
                            SizedBox(height: 16),

                            // Add Documents Button
                            TextButton(
                              onPressed: () {
                                // Handle Add Documents
                              },
                              child: Text('Attach'),
                            ),
                            SizedBox(height: 16),

                            // Submit Button
                            ElevatedButton(
                              onPressed: () {
                                // Handle form submission
                              },
                              child: Text('Submit'),
                            ),
                          ],
                        )))),
          ],
        ),
      )),
    );
  }
}
