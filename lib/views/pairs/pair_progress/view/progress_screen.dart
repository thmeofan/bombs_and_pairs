// import 'package:flutter/material.dart';
// import '../widget/level_button.dart';
// import '../widget/line_painter.dart';
//
// class ProgressScreen extends StatefulWidget {
//   const ProgressScreen({super.key});
//
//   @override
//   _ProgressScreenState createState() => _ProgressScreenState();
// }
//
// class _ProgressScreenState extends State<ProgressScreen> {
//   final int numberOfLevels = 5;
//   int selectedLevelIndex = 0;
//
//   void _onPrevious() {
//     setState(() {
//       selectedLevelIndex =
//           (selectedLevelIndex - 1 + numberOfLevels) % numberOfLevels;
//     });
//   }
//
//   void _onNext() {
//     setState(() {
//       selectedLevelIndex = (selectedLevelIndex + 1) % numberOfLevels;
//     });
//   }
//
//   void _onStartLevel() {
//     switch (selectedLevelIndex) {
//       case 0:
//         if (life >= 1) {
//           Navigator.of(context).pushNamed(AppRoutes.lvl1);
//           score -= 50;
//           life -= 1;
//         } else {
//           ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(
//               content: Text(
//                 'Sorry, you\'re out of lives',
//                 style: TextStyle(color: Colors.white),
//               ),
//               backgroundColor: Color(0xFFEAAD82),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.all(Radius.circular(10)),
//               ),
//               margin: EdgeInsets.symmetric(horizontal: 150),
//               behavior: SnackBarBehavior.floating,
//               duration: Duration(seconds: 2),
//             ),
//           );
//         }
//         break;
//
//       case 1:
//         if (life >= 1) {
//           Navigator.of(context).pushNamed(AppRoutes.lvl2);
//           score -= 50;
//           life -= 1;
//         } else {
//           ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(
//               content: Text(
//                 'Sorry, you\'re out of lives',
//                 style: TextStyle(color: Colors.white),
//               ),
//               backgroundColor: Color(0xFFEAAD82),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.all(Radius.circular(10)),
//               ),
//               margin: EdgeInsets.symmetric(horizontal: 200),
//               behavior: SnackBarBehavior.floating,
//               duration: Duration(seconds: 2),
//             ),
//           );
//         }
//         break;
//       case 2:
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(
//             content: Text(
//               'This level isn\'t unlocked yet',
//               style: TextStyle(color: Colors.white),
//             ),
//             backgroundColor: Color(0xFFEAAD82),
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.all(Radius.circular(10)),
//             ),
//             margin: EdgeInsets.symmetric(horizontal: 200),
//             behavior: SnackBarBehavior.floating,
//             duration: Duration(seconds: 2),
//           ),
//         );
//         break;
//       case 3:
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(
//             content: Text(
//               'This level isn\'t unlocked yet',
//               style: TextStyle(color: Colors.white),
//             ),
//             backgroundColor: Color(0xFFEAAD82),
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.all(Radius.circular(10)),
//             ),
//             margin: EdgeInsets.symmetric(horizontal: 200),
//             behavior: SnackBarBehavior.floating,
//             duration: Duration(seconds: 2),
//           ),
//         );
//         break;
//       case 4:
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(
//             content: Text(
//               'This level isn\'t unlocked yet',
//               style: TextStyle(color: Colors.white),
//             ),
//             backgroundColor: Color(0xFFEAAD82),
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.all(Radius.circular(10)),
//             ),
//             margin: EdgeInsets.symmetric(horizontal: 200),
//             behavior: SnackBarBehavior.floating,
//             duration: Duration(seconds: 2),
//           ),
//         );
//         break;
//       default:
//         Navigator.of(context).pushNamed(AppRoutes.lvl1);
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     final screenHeight = MediaQuery.of(context).size.height;
//
//     final List<Offset> levelButtonPositions = [
//       Offset(screenWidth * 0.15, screenHeight * 0.6),
//       Offset(screenWidth * 0.325, screenHeight * 0.2),
//       Offset(screenWidth * 0.5, screenHeight * 0.6),
//       Offset(screenWidth * 0.65, screenHeight * 0.2),
//       Offset(screenWidth * 0.85, screenHeight * 0.6),
//     ];
//
//     return Scaffold(
//       body: Container(
//         decoration: const BoxDecoration(
//             image: DecorationImage(
//           image: AssetImage('assets/images/background.png'),
//           fit: BoxFit.cover,
//         )),
//         child: Stack(children: [
//           CustomPaint(
//             size: Size(screenWidth, screenHeight),
//             painter: LinePainter(points: levelButtonPositions),
//           ),
//           Padding(
//             padding: EdgeInsets.only(
//               top: screenHeight * 0.02,
//             ),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 const Spacer(),
//                 Padding(
//                   padding: EdgeInsets.only(
//                     left: screenHeight * 0.2,
//                   ),
//                   child: Row(
//                     children: [
//                       SizedBox(
//                           height: screenWidth * 0.15,
//                           width: screenWidth * 0.14),
//                       LevelButton(
//                         assetName: 'assets/images/lvl2.svg',
//                         isSelected: selectedLevelIndex == 1,
//                         onTap: () {
//                           setState(() {
//                             selectedLevelIndex = 1;
//                           });
//                           _onStartLevel();
//                         },
//                       ),
//                       SizedBox(
//                           height: screenWidth * 0.15,
//                           width: screenWidth * 0.18),
//                       LevelButton(
//                         assetName: 'assets/images/lvl4.svg',
//                         isSelected: selectedLevelIndex == 3,
//                         onTap: () {
//                           setState(() {
//                             selectedLevelIndex = 3;
//                           });
//                           _onStartLevel();
//                         },
//                       ),
//                     ],
//                   ),
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     LevelButton(
//                       assetName: 'assets/images/lvl1.svg',
//                       isSelected: selectedLevelIndex == 0,
//                       onTap: () {
//                         setState(() {
//                           selectedLevelIndex = 0;
//                         });
//                         _onStartLevel();
//                       },
//                     ),
//                     SizedBox(
//                         height: screenWidth * 0.15, width: screenWidth * 0.15),
//                     LevelButton(
//                       assetName: 'assets/images/lvl3.svg',
//                       isSelected: selectedLevelIndex == 2,
//                       onTap: () {
//                         setState(() {
//                           selectedLevelIndex = 2;
//                         });
//                         _onStartLevel();
//                       },
//                     ),
//                     SizedBox(
//                         height: screenWidth * 0.15, width: screenWidth * 0.15),
//                     LevelButton(
//                       assetName: 'assets/images/lvl5.svg',
//                       isSelected: selectedLevelIndex == 4,
//                       onTap: () {
//                         setState(() {
//                           selectedLevelIndex = 4;
//                         });
//                         _onStartLevel();
//                       },
//                     ),
//                   ],
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     NavigationButton(
//                       assetName: 'assets/images/previous.png',
//                       onTap: () {
//                         _onPrevious();
//                       },
//                       buttonWidth: screenWidth * 0.1,
//                     ),
//                     SizedBox(
//                       width: screenWidth * 0.02,
//                     ),
//                     StartButton(
//                       buttonWidth: screenWidth * 0.2,
//                       buttonHeight: screenHeight * 0.3,
//                       assetName: 'assets/images/start.png',
//                       onTap: () {
//                         _onStartLevel();
//                       },
//                     ),
//                     SizedBox(
//                       width: screenWidth * 0.02,
//                     ),
//                     NavigationButton(
//                       assetName: 'assets/images/next.png',
//                       onTap: () {
//                         _onNext();
//                       },
//                       buttonWidth: screenWidth * 0.1,
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//           Positioned(
//             top: screenHeight * 0.1,
//             left: screenWidth * 0.025,
//             child: NavigationButton(
//               assetName: 'assets/images/home.png',
//               onTap: () {
//                 Navigator.of(context).pushNamed(
//                   AppRoutes.home,
//                 );
//               },
//               buttonWidth: screenWidth * 0.08,
//             ),
//           ),
//           Positioned(
//             top: screenHeight * 0.035,
//             right: -screenWidth * 0.025,
//             child: const Column(
//               children: [
//                 ScoreWidget(),
//                 //   HeartWidget(),
//               ],
//             ),
//           ),
//         ]),
//       ),
//     );
//   }
// }
