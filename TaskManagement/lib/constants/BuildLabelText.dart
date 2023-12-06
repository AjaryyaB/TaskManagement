import 'package:flutter/material.dart';
import 'package:taskmanagement/constants/AppConstants.dart';
class BuildLabelText{
  static Widget buildLabelText(String labelName){
    return Container(
      // constraints:const BoxConstraints(maxWidth: 380, maxHeight: 60),
      child: Align(

        alignment: Alignment.centerLeft,
        child: Text(labelName,
            style: const TextStyle(color: AppConstants.lightGrey)),
      ),
    );
  }


}