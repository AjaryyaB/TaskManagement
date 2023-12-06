import 'package:flutter/material.dart';
import 'package:taskmanagement/constants/AppConstants.dart';

class GenerateButton{

  static Widget generateButton(BuildContext context,void Function()? onPressed,String value){
    final screenSize = MediaQuery.of(context).size;
    return  SizedBox(
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
        onPressed: onPressed,
        child: Text(
         value,
          style: TextStyle(
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}