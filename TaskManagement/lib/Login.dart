import 'package:flutter/material.dart';
import 'package:footer/footer.dart';
import 'package:footer/footer_view.dart';
import 'package:taskmanagement/Dashboard.dart';
import 'package:taskmanagement/ForgotPassword.dart';
import 'package:taskmanagement/constants/AppConstants.dart';
import 'package:taskmanagement/constants/BackgroundImage.dart';
import 'package:taskmanagement/constants/BuildTextFormField.dart';
import 'package:taskmanagement/constants/Toast.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);

  Widget buildInputLabel(String labelName) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(labelName,
          style: const TextStyle(color: AppConstants.boldBlue, fontSize: 18)),
    );
  }

  Widget buildTextFormField(String hintText, Widget icon) {
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

  Widget buildForgotPassword(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ForgotPassword()),
        );
      },
      child: Align(
        alignment: Alignment.centerRight,
        child: Text("Forgot password?",
            style: const TextStyle(color: AppConstants.boldBlue, fontSize: 15)),
      ),
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
        child: SingleChildScrollView(
          child: GestureDetector(
            onTap: () {
              // Unfocus the current focus when tapped outside the TextFormField
              FocusScope.of(context).unfocus();
            },
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    margin: EdgeInsets.only(top:60 ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/logo@2x.png",
                          height: 160,
                          width: 280,
                        )
                      ],
                    ),
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
                            buildHeading("Sign in"),
                            SizedBox(
                              height: screenSize.height * 0.015,
                            ),
                            Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  buildInputLabel("Email ID"),
                                  SizedBox(
                                    height: screenSize.height * 0.015,
                                  ),
                                  BuildTextFormField.buildTextFormField(
                                      "Enter Email",
                                      AppConstants.personIcon,
                                      emailController),
                                  SizedBox(
                                    height: screenSize.height * 0.015,
                                  ),
                                  buildInputLabel("Password"),
                                  SizedBox(
                                    height: screenSize.height * 0.015,
                                  ),
                                  BuildTextFormField.buildTextFormField(
                                      "Enter Password",
                                      AppConstants.passwordIcon,
                                      passwordController),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: screenSize.height * 0.015,
                            ),
                            buildForgotPassword(context),

                            SizedBox(
                              height: screenSize.height * 0.050,
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
                                  "Sign in",
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
                  SizedBox(
                    height: screenSize.height * 0.090,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10.0),

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "© Copyright 2023 Falcon. All Rights Reserved",
                          style: TextStyle(
                            color: Colors.white, // Set your desired text color here
                          ),
                        ),
                      ],
                    ),
                  )
                ]),
          ),
        ),
      ));
  }
}
