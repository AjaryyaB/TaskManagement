import 'package:flutter/material.dart';
import 'package:taskmanagement/LandingPage.dart';
import 'package:taskmanagement/Login.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp( TaskManagement());
}

class TaskManagement extends StatefulWidget {
  const TaskManagement({super.key});

  @override
  State<TaskManagement> createState() => _TaskManagementState();
}

class _TaskManagementState extends State<TaskManagement> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(textTheme).copyWith(
          bodyMedium: GoogleFonts.poppins(textStyle: textTheme.bodyMedium),
        ),
      ),
      home: LandingPage(),
    );
  }
}
