import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppConstants {
  //Images
  static const String backgroundImage = "assets/images/bg@3x.jpg";
  static const String logo = "assets/images/logo.png";

  //Colors
  static const Color boldBlue = Color.fromRGBO(20, 30, 85, 1);

  static const Color cardbackground = Color.fromRGBO(239, 243, 252, 1);
  static const Color inputBackground = Color.fromRGBO(249, 250, 255, 1);
  static const Color inputBorder = Color.fromRGBO(249, 250, 255, 1);
  static const Color underlineColor = Color.fromRGBO(20, 30, 85, 1);
  static const Color lightGrey = Color.fromRGBO(112, 112, 112, 1);
  static const Color hintText = Color.fromRGBO(196, 196, 196, 1);
  static const Color pinputColor = Color.fromRGBO(222, 226, 255, 1);
  static const Color tabHeaderText = Color.fromRGBO(83, 98, 194, 1);
  static const Color tabDivider = Color.fromRGBO(173, 200, 242, 1);
  static const Color resendCodeText = Color.fromRGBO(41, 206, 52, 1);
  static const Color subTextColor =Color.fromRGBO(130, 139, 194, 1);
  static const Color boldBlue1 = Color.fromRGBO(46, 42, 96, 1);

  //Icons
  static Image personIcon = Image.asset(
    'assets/images/mail.png',
    height: 24,
    width: 24,
  );
  static Image passwordIcon = Image.asset(
    'assets/images/passwordicon.png',
    height: 24,
    width: 24,
  );

  static Image calenderIcon = Image.asset(
    'assets/images/Iconly-Light-Outline-Calendar.png',
    height: 24,
    width: 24,
  );
}
