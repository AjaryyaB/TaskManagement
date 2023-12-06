import 'package:flutter/material.dart';
import 'package:taskmanagement/constants/AppConstants.dart';

class DescriptionTextArea {

  
 
 static Widget buildDescriptionTextArea(TextEditingController controller) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 390, maxHeight: 160),
      child: TextFormField(

        controller: controller,
        maxLines: null, // Allows for an unlimited number of lines
        keyboardType: TextInputType.multiline,
        decoration: InputDecoration(
          labelText: 'Description',
          labelStyle: TextStyle(color: AppConstants.hintText),
          filled: true,
          fillColor: AppConstants.inputBackground,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18.0),
            borderSide: const BorderSide(
              color: AppConstants.inputBorder, // Border color in RGBA
            ),
          ),
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
