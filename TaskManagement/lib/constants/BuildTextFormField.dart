import 'package:flutter/material.dart';
import 'package:taskmanagement/constants/AppConstants.dart';

class BuildTextFormField {
  static Widget buildTextFormField(
      String labelText, Widget icon, TextEditingController controller) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 390, maxHeight: 60),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          labelStyle: TextStyle(color: AppConstants.hintText),
          filled: true,
          fillColor: AppConstants.inputBackground,
          // Set background color to white
          suffixIcon: SizedBox(),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18.0),
            borderSide: const BorderSide(
              color: AppConstants.inputBorder, // Border color in RGBA
            ),
          ),
        ), // Icon on the left side

        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter some text';
          }
          return null; // Return null if the input is valid
        },
      ),
    );
  }
}
