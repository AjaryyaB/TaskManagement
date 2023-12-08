// import 'package:flutter/material.dart';
// import 'package:taskmanagement/constants/AppConstants.dart';
// import 'package:taskmanagement/constants/BackgroundImage.dart';
// import 'package:taskmanagement/constants/BuildLabelText.dart';
//
// class AllTasks extends StatefulWidget {
//   const AllTasks({Key? key}) : super(key: key);
//
//   @override
//   State<AllTasks> createState() => _AllTasksState();
// }
//
// class _AllTasksState extends State<AllTasks> {
//   @override
//   Widget build(BuildContext context) {
//     // Calculate the available height by subtracting the AppBar's preferred size.
//     final double appBarHeight = AppBar().preferredSize.height;
//     final double statusBarHeight = MediaQuery.of(context).padding.top;
//     final double availableHeight =
//         MediaQuery.of(context).size.height - appBarHeight - statusBarHeight;
//     final double screenwidth = MediaQuery.of(context).size.width;
//     return Scaffold(
//       extendBodyBehindAppBar: true,
//       appBar: AppBar(
//         title: const Text("All Tasks"),
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//       ),
//       body: BackgroundStack(
//         child: GestureDetector(
//           onTap: () {
//             FocusScope.of(context)
//                 .unfocus(); // Unfocus when tapped outside TextFormField
//           },
//           child: SingleChildScrollView(
//             child: ConstrainedBox(
//               constraints: BoxConstraints(
//                   minHeight: availableHeight,
//                   // Ensure the Card takes up the available height
//                   minWidth: screenwidth),
//               child: IntrinsicHeight(
//                 child: Card(
//                   color: AppConstants.cardbackground,
//                   margin: EdgeInsets.zero, // Remove any default margin
//                   shape: const RoundedRectangleBorder(
//                     borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(20.0),
//                       topRight: Radius.circular(20.0),
//                     ),
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.all(20),
//                     child: Column(
//                       children: [],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:taskmanagement/constants/AppConstants.dart';
// Assuming BackgroundImage.dart contains a widget that provides the background image
import 'package:taskmanagement/constants/BackgroundImage.dart';
import 'package:taskmanagement/constants/BuildLabelText.dart';

class AllTasks extends StatefulWidget {
  const AllTasks({Key? key}) : super(key: key);

  @override
  State<AllTasks> createState() => _AllTasksState();
}

class _AllTasksState extends State<AllTasks> {
  @override
  Widget build(BuildContext context) {
    final  screenSize = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,  // This allows the body to be drawn behind the AppBar
      appBar: AppBar(
        title: const Text("All Tasks"),
        backgroundColor: Colors.transparent, // AppBar background color as transparent
        elevation: 0, // No shadow
      ),
      body: BackgroundStack(  // Your custom widget that includes the background image
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus(); // Unfocus when tapped outside TextFormField
          },
          child: Container(
            child: Column(
              children: [
                // This pushes the card down below the AppBar
                Expanded(
                  child: SingleChildScrollView(
                    child: Card(
                      color: AppConstants.cardbackground,
                      margin: EdgeInsets.zero, // No default margin
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: [
                            // Your content here
                            SizedBox(height: screenSize.height * 0.01),

                            // Group Dropdown

                            BuildLabelText.buildLabelText("Priority"),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
