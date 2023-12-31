import 'package:flutter/material.dart';
import 'package:taskmanagement/constants/AppConstants.dart';


class BackgroundStack extends StatelessWidget {
  final Widget child;

  const BackgroundStack({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        // Unfocus the current focus when tapped outside the TextFormField
        FocusScope.of(context).unfocus();
      },
      child: SizedBox(
        height: screenSize.height,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              AppConstants.backgroundImage, // Use the global background image
              fit: BoxFit.cover,
            ),
            Center(child: child),
          ],
        ),
      ),
    );
  }
}
