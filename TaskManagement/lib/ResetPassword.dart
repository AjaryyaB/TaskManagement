import 'package:flutter/material.dart';
import 'package:taskmanagement/Dashboard.dart';
import 'package:taskmanagement/constants/AppConstants.dart';
import 'package:taskmanagement/constants/BackgroundImage.dart';
import 'package:taskmanagement/constants/BuildTextFormField.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  Widget buildHeading(String heading) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: Text(heading,
              style: const TextStyle(
                  color: AppConstants.boldBlue,
                  fontSize: 28,
                  fontWeight: FontWeight.bold)),
        ),
      ],
    );
  }

  Widget buildInputLabel(String labelName) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(labelName,
          style: const TextStyle(color: AppConstants.boldBlue, fontSize: 18)),
    );
  }

  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: Colors.transparent,
        body: BackgroundStack(
          child: ListView(
            children:[GestureDetector(
              onTap: () {
                // Unfocus the current focus when tapped outside the TextFormField
                FocusScope.of(context).unfocus();
              },
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 60),
                      child: Image.asset(
                        "assets/images/logo@2x.png",
                        height: 160,
                        width: 280,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: screenSize.height * 0.050,
                ),
                Container(
                  constraints: BoxConstraints(maxWidth: 320),
                  child: Card(
                    color: AppConstants.cardbackground,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          20.0), // Adjust the value as needed
                    ),
                    elevation: 5, // Add elevation for a shadow effect
                    child: Padding(
                      padding: EdgeInsets.all(18.0),
                      child: Column(
                        children: [
                          buildHeading("Reset Password"),
                          SizedBox(
                            height: screenSize.height * 0.015,
                          ),
                          Container(
                            child: Text(
                                "Set the new password for your account so you can login and access all the features."),
                          ),
                          SizedBox(
                            height: screenSize.height * 0.015,
                          ),
                          Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                buildInputLabel("New Password"),
                                SizedBox(
                                  height: screenSize.height * 0.015,
                                ),
                                BuildTextFormField.buildTextFormField(
                                    "Password",
                                    AppConstants.passwordIcon,
                                    emailController),
                                SizedBox(
                                  height: screenSize.height * 0.015,
                                ),
                                buildInputLabel("Confirm Password"),
                                SizedBox(
                                  height: screenSize.height * 0.015,
                                ),
                                BuildTextFormField.buildTextFormField(
                                    "Confirm Password",
                                    AppConstants.passwordIcon,
                                    emailController),
                                SizedBox(
                                  height: screenSize.height * 0.050,
                                ),
                              ],
                            ),
                          ),
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
                                print("Email : ${emailController.text}");
                                print("Email : ${emailController.text}");
                                // Toastify.successToast(context, "Login Success");
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Dashboard()),
                                );
                              },
                              child: Text(
                                "Continue",
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ]),
            )] ,
          ),
        ));
  }
}
