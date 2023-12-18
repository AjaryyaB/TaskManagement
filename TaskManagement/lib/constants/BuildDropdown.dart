import 'package:flutter/material.dart';
import 'package:taskmanagement/constants/AppConstants.dart';

class BuildDropdown {
  static Widget buildDropdown(List<String> items, String? hintText,
      void Function(String?)? onChanged) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 390, maxHeight: 50),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          alignLabelWithHint: true,
          filled: true,
          fillColor: AppConstants.inputBackground,
        hintText: hintText,
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          labelStyle: TextStyle(color: AppConstants.hintText),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18.0),
            borderSide: const BorderSide(
              color: AppConstants.inputBorder, // Border color in RGBA
            ),
          ),
        ),
        items: items.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: onChanged,
      ),
    );
  }
}
