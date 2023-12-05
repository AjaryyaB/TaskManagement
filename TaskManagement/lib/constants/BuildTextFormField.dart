import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taskmanagement/constants/AppConstants.dart';
class BuildTextFormField {
 static Widget buildTextFormField(String hintText, Widget icon) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hintText,

        // filled: true,
        fillColor: AppConstants.inputBackground,
        // Set background color to white
        suffixIcon: IconButton(
          onPressed: null,
          icon: icon,
        ),
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
    );
  }
}
