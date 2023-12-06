import 'package:flutter/material.dart';
import 'package:taskmanagement/constants/AppConstants.dart';

class DescriptionTextArea {
  static Widget buildDescriptionTextArea(TextEditingController controller) {
    return Container(
      // constraints: const BoxConstraints(maxWidth: 390, maxHeight: 160),
      // height: 300,
      child: TextFormField(
        controller: controller,
        maxLines: null,
        // Allows for an unlimited number of lines
        keyboardType: TextInputType.multiline,

        decoration: InputDecoration(
          labelText: 'Enter Description',
          labelStyle: TextStyle(
            color: AppConstants.hintText,
          ),
          filled: true,
          fillColor: AppConstants.inputBackground,
          alignLabelWithHint: true,
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          // Controls the behavior of the floating label
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18.0),
            borderSide: const BorderSide(
              color: AppConstants.inputBorder, // Border color in RGBA
            ),
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 40.0, horizontal: 16.0), // Adjust padding to increase input box size
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter a description';
          }
          return null; // Return null if the input is valid
        },
      ),
    );
  }
}
