import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taskmanagement/constants/AppConstants.dart';
import 'package:taskmanagement/constants/BackgroundImage.dart';
import 'package:taskmanagement/constants/BuildDropdown.dart';
import 'package:taskmanagement/constants/BuildLabelText.dart';
import 'package:taskmanagement/constants/BuildTextFormField.dart';

class CreateEntity extends StatefulWidget {
  const CreateEntity({super.key});

  @override
  State<CreateEntity> createState() => _CreateEntityState();
}

class _CreateEntityState extends State<CreateEntity> {
  String? selectedEntityStatus;
  TextEditingController entityNameController = TextEditingController();
  TextEditingController entityDescriptionController = TextEditingController();
  TextEditingController entityCINController = TextEditingController();
  TextEditingController entityGSTController = TextEditingController();
  TextEditingController entityLegalNameController = TextEditingController();
  TextEditingController entityAddressController = TextEditingController();
  TextEditingController entityContactController = TextEditingController();
  TextEditingController entityEmailController = TextEditingController();
  TextEditingController entityWebAddressController = TextEditingController();

  List<String> entityStatus = ['Active', 'InActive'];

  void onEntiytStatusChanged(String? value) {
    setState(() {
      selectedEntityStatus = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        body: BackgroundStack(
            child: SafeArea(
                child: Column(

      children: [
        SizedBox(
          height: screenHeight * 0.03,
        ),
        AppBar(
            title: const Text("Create Entity"),
            backgroundColor: Colors.transparent,
            elevation: 0),
        SizedBox(height: screenHeight * 0.02),
        Expanded(
          child: Container(

          //  color: AppConstants.cardbackground,
            decoration: const BoxDecoration(
              color: AppConstants.cardbackground,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
            ),
            child: Container(
              decoration: const BoxDecoration(
                color: AppConstants.cardbackground,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: screenHeight * 0.02,),
                      BuildLabelText.buildLabelText("Entity Name"),
                      SizedBox(height: screenHeight * 0.01,),
                      BuildTextFormField.buildTextFormField(
                          'Entity Name', const SizedBox(), entityNameController),
                      SizedBox(height: screenHeight * 0.02,),
                      BuildLabelText.buildLabelText("Entity Description"),
                      SizedBox(height: screenHeight * 0.01,),
                      BuildTextFormField.buildTextFormField('Description',
                          const SizedBox(), entityDescriptionController),
                      SizedBox(height: screenHeight * 0.02,),
                      BuildLabelText.buildLabelText("Entity Status"),
                      SizedBox(height: screenHeight * 0.01,),
                      BuildDropdown.buildDropdown(
                          entityStatus, "Select Task Type", onEntiytStatusChanged),
                      SizedBox(height: screenHeight * 0.02,),
                      BuildLabelText.buildLabelText("Entity CIN"),
                      SizedBox(height: screenHeight * 0.01,),
                      BuildTextFormField.buildTextFormField('Entity CIN',
                          const SizedBox(), entityCINController),
                      SizedBox(height: screenHeight * 0.02,),
                      BuildLabelText.buildLabelText("Entity GST"),
                      SizedBox(height: screenHeight * 0.01,),
                      BuildTextFormField.buildTextFormField('Entity GST',
                          const SizedBox(), entityGSTController),
                      SizedBox(height: screenHeight * 0.02,),
                      BuildLabelText.buildLabelText("Entity LegalName"),
                      SizedBox(height: screenHeight * 0.01,),
                      BuildTextFormField.buildTextFormField('Entity LegalName',
                          const SizedBox(), entityLegalNameController),
                      SizedBox(height: screenHeight * 0.02,),
                      BuildLabelText.buildLabelText("Entity Address"),
                      SizedBox(height: screenHeight * 0.01,),
                      BuildTextFormField.buildTextFormField('Entity Address',
                          const SizedBox(), entityAddressController),
                      SizedBox(height: screenHeight * 0.02,),
                      BuildLabelText.buildLabelText("Entity Contact"),
                      SizedBox(height: screenHeight * 0.01,),
                      BuildTextFormField.buildTextFormField('Entity Contact',
                          const SizedBox(), entityContactController),
                      SizedBox(height: screenHeight * 0.02,),
                      BuildLabelText.buildLabelText("Entity Email"),
                  SizedBox(height: screenHeight * 0.01,),
                      BuildTextFormField.buildTextFormField('Entity Email',
                          const SizedBox(), entityEmailController),
                      SizedBox(height: screenHeight * 0.02,),
                      BuildLabelText.buildLabelText("Entity WebAddress(URL)"),
                      SizedBox(height: screenHeight * 0.01,),
                      BuildTextFormField.buildTextFormField(
                          'Entity WebAddress(URL)',
                          const SizedBox(),
                          entityWebAddressController),
                      SizedBox(height: screenHeight * 0.02,),
                      Align(
                        alignment: Alignment.center,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: AppConstants.boldBlue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    10.0), // Set the border radius here
                              ),
                              minimumSize:
                                  Size(200, 52), // Set the background color here
                            ),
                            onPressed: () {},
                            child: Text("Submit")),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    ))));
  }
}
