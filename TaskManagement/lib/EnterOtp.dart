import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pinput/pinput.dart';
import 'package:taskmanagement/Dashboard.dart';
import 'package:taskmanagement/Login.dart';
import 'package:taskmanagement/ResetPassword.dart';
import 'package:taskmanagement/constants/AppConstants.dart';
import 'package:taskmanagement/constants/BackgroundImage.dart';

class EnterOtp extends StatefulWidget {
  const EnterOtp({super.key});

  @override
  State<EnterOtp> createState() => _EnterOtpState();
}

class _EnterOtpState extends State<EnterOtp> {
  late PinTheme defaultPinTheme;
  late PinTheme focusedPinTheme;
  late PinTheme submittedPinTheme;

  @override
  void initState() {
    defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(

          fontSize: 20,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: AppConstants.pinputColor, width: 1),
        borderRadius: BorderRadius.circular(20),

      ),

    );

    focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    );

    submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        color: Color.fromRGBO(234, 239, 243, 1),
        border: Border.all(color: AppConstants.pinputColor),
      ),
    );
  }

  final _formKey = GlobalKey<FormState>();
  late Timer _resendTimer;
  int _remainingTime = 60;
  bool _isTimerRunning = false;
  @override
  void dispose() {
    _resendTimer.cancel(); // Cancel the timer to prevent memory leaks
    super.dispose();
  }
  void startResendTimer() {
    const int timerDurationInSeconds = 1; // Set the timer duration here
    _isTimerRunning = true;
    _resendTimer = Timer.periodic(Duration(seconds: timerDurationInSeconds), (timer) {
      setState(() {
        if (_remainingTime > 0) {
          _remainingTime--;
        } else {
          _isTimerRunning = false;
          _resendTimer?.cancel();
        }
      });
    });
  }

  void resendCode() {
    // Implement your code to resend the OTP here
    // For demonstration purposes, I'm starting the timer here
    _remainingTime = 60;
    startResendTimer();
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
                  fontSize: 24,
                  fontWeight: FontWeight.bold)),
        ),
      ],
    );
  }
  Widget buildResendCode(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: _isTimerRunning
              ? Text(
            "Time Remaining: $_remainingTime Sec",
            style: const TextStyle(
              color: AppConstants.boldBlue,
              fontSize: 12,
            ),
          )
              : SizedBox.shrink(), // Hide the text when the timer is not running
        ),
        InkWell(
          onTap: _isTimerRunning ? null : () => resendCode(),
          child: Text(
            "Resend Code",
            style: const TextStyle(
              color: AppConstants.boldBlue,
              fontSize: 15,
            ),
          ),
        ),
      ],
    );
  }

  var otpController = TextEditingController();
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
                          buildHeading("Enter 4 Digits Code"),
                          SizedBox(
                            height: screenSize.height * 0.015,
                          ),
                          Container(
                            child: Text(
                                "Enter 4 digits code that you received on your email."),
                          ),
                          SizedBox(
                            height: screenSize.height * 0.015,
                          ),
                          Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                Pinput(
                                  // obscureText: true,
                                  defaultPinTheme: defaultPinTheme,
                                  focusedPinTheme: focusedPinTheme,
                                  submittedPinTheme: submittedPinTheme,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                      RegExp(r'[0-9]'),
                                    ),
                                  ],
                                  validator: (s) {
                                    return s == '2222'
                                        ? null
                                        : 'Pin is incorrect';
                                  },
                                  pinputAutovalidateMode:
                                  PinputAutovalidateMode.onSubmit,

                                  showCursor: true,
                                  onCompleted: (pin) => print(pin),
                                  controller: otpController,
                                ),
                                SizedBox(
                                  height: screenSize.height * 0.015,
                                ),
                                buildResendCode(context),
                                if(_isTimerRunning)
                                  SizedBox(
                                    height: screenSize.height * 0.015,
                                  ),
                                Visibility(

                                    visible: _isTimerRunning,
                                    child:
                                Center(child: Text("Code Sent Succesfully",style: TextStyle(color: AppConstants.resendCodeText,fontSize: 16),))
                                ),

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
                                // Toastify.successToast(context, "Login Success");
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ResetPassword()),
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
            ),]
          ),
        ));
  }
}
