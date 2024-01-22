import 'package:flutter/material.dart';

//
// class ResultScreen extends StatelessWidget {
//   const ResultScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       body: Stack(
//         children: [
//           Container(
//             decoration: const BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage('assets/images/background.png'),
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           Center(
//             child: Stack(
//               alignment: Alignment.center,
//               children: [
//                 Container(
//                   height: size.height * 0.8,
//                   width: size.width * 0.6,
//                   decoration: const BoxDecoration(
//                     image: DecorationImage(
//                       image: AssetImage('assets/images/banner.png'),
//                       fit: BoxFit.contain,
//                     ),
//                   ),
//                 ),
//
//                 Positioned(
//                   bottom: -(size.height * 0.1),
//                   right: -(size.width * 0.08),
//                   child: Image.asset(
//                     'assets/images/chipmunk.png',
//                     height: size.height * 0.9,
//                     fit: BoxFit.contain,
//                   ),
//                 ),
//                 // Content inside the banner
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Text(
//                       'YOUR SCORE\n IS: ${score.toString()}',
//                       style: MenuTextStyle.gradientTextStyle,
//                     ),
//                   ],
//                 ),
//
//                 Positioned(
//                   bottom: 10,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       StartButton(
//                         onTap: () {
//                           Navigator.of(context).pushNamed(
//                             AppRoutes.home,
//                           );
//                         },
//                         assetName: 'assets/images/okay.png',
//                         buttonWidth: size.width * 0.2,
//                         buttonHeight: size.height * 0.3,
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Positioned(
//             top: size.height * 0.1,
//             left: size.width * 0.025,
//             child: Row(
//               children: [
//                 NavigationButton(
//                   assetName: 'assets/images/home.png',
//                   onTap: () {
//                     Navigator.of(context).pushNamed(
//                       AppRoutes.home,
//                     );
//                   },
//                   buttonWidth: size.width * 0.08,
//                 ),
//                 NavigationButton(
//                   assetName: 'assets/images/settings.png',
//                   onTap: () {
//                     Navigator.of(context).pushNamed(
//                       AppRoutes.settingsScreen,
//                     );
//                   },
//                   buttonWidth: size.width * 0.08,
//                 ),
//               ],
//             ),
//           ),
//           Positioned(
//             top: size.height * 0.035,
//             right: -size.width * 0.025,
//             child: const Column(
//               children: [
//                 ScoreWidget(),
//                 HeartWidget(),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
